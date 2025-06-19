import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/creator/explore/explore.dart';
import 'package:zeazn_invest_app/features/creator/insights/insights.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';
import 'package:zeazn_invest_app/routes/app.pages.dart';
import 'package:zeazn_invest_app/shared/shared.dart';

class ZInsightsDetailPage extends StatelessWidget {
  ZInsightsDetailPage({super.key});

  final ctrl = Get.put(ZInsightsVM());

  @override
  Widget build(BuildContext context) {
    return ZZeaznScaffold(
      backgroundColor: ZAppColor.offWhiteColor,
      logoPath: Assets.icons.logoDark.svg(height: ZAppSize.s55),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ZAppSize.s8.verticalSpace,
          Icon(
            Icons.arrow_back_ios,
            color: ZAppColor.blackColor,
          ).onPressed(onTap: () => ZHelperFunction.pop()),

          ZAppSize.s14.verticalSpace,

          Container(
            padding: EdgeInsets.all(ZAppSize.s8),
            width: ZDeviceUtil.getDeviceWidth(context),
            decoration: BoxDecoration(
              color: ZAppColor.blackColor,
              borderRadius: BorderRadius.circular(ZAppSize.s4),
            ),
            child: Text(
              'your_performing_campaigns'.tr,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: ZAppSize.s13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ).centered(),
          ZAppSize.s14.verticalSpace,

          Expanded(
            child: ListView.builder(
              itemCount: projects.take(1).toList().length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final project = projects.take(1).toList()[index];
                return ZProjectListWidget(
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
          ),
        ],
      ),
    );
  }
}
