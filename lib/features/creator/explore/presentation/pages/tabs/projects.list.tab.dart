import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/creator/explore/explore.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';
import 'package:zeazn_invest_app/routes/app.pages.dart';
import 'package:zeazn_invest_app/shared/shared.dart';

class ZProjectListTab extends StatelessWidget {
  ZProjectListTab({super.key});

  final ctrl = Get.put(ZExploreVM());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ctrl.loading.value == LoadingState.loading
          ? ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return ZProjectListWidgetRedact(
                  loading: ctrl.loading.value,
                  ctrl: ctrl,
                );
              },
            )
          : ctrl.projects.isEmpty
          ? emptyProjectState(context)
          : ListView.builder(
              itemCount: ctrl.projects.length,
              itemBuilder: (context, index) {
                final project = ctrl.projects[index];
                return ZProjectListWidget(
                  loading: ctrl.loading.value,
                  project: project,
                  ctrl: ctrl,
                  onTap: () {
                    ZHelperFunction.switchScreen(
                      destination: Routes.projectDetailPage,
                      args: project,
                    );
                  },
                );
              },
            ),
    );
  }

  Widget emptyProjectState(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          Assets.images.noProjectImg.path,
          // fit: BoxFit.cover,
          // height: ZDeviceUtil.getDeviceHeight(context) / 2,
        ),
        ZAppSize.s25.verticalSpace,
        Text(
          'no_projects_msg'.tr,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: ZAppColor.blackColor,
            fontWeight: FontWeight.w300,
          ),
        ),
        ZAppSize.s12.verticalSpace,
        ZCustomMiniButton(
          text: 'create_a_project'.tr,
          onTap: () =>
              ZHelperFunction.switchScreen(destination: Routes.projectInfoPage),
        ),
      ],
    ).scrollable();
  }
}
