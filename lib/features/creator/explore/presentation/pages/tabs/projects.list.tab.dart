import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/creator/explore/explore.dart';
import 'package:zeazn_invest_app/routes/app.pages.dart';
import 'package:zeazn_invest_app/shared/shared.dart';

class ZProjectListTab extends StatelessWidget {
  ZProjectListTab({super.key});

  final ctrl = Get.put(ZExploreVM());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Expanded(
            child: RefreshIndicator.adaptive(
              backgroundColor: ZAppColor.primary,
              color: ZAppColor.whiteColor,
              onRefresh: () => ctrl.getAllProjectsByCreator(context: context),
              child: ctrl.loading.value == LoadingState.loading
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
                  ? ZEmptyProjectState()
                  : ZAnimatedListView<Project>(
                      scrollController: ctrl.projectScrollController,
                      child: (index, project) => ZProjectListWidget(
                        loading: ctrl.loading.value,
                        project: project,
                        ctrl: ctrl,
                        onTap: () {
                          ZHelperFunction.switchScreen(
                            destination: Routes.projectDetailPage,
                            args: project,
                          );
                        },
                      ),
                      items: ctrl.projects,
                    ),
            ),
          ),
          // load more here
          if (ctrl.loadingMore.value == LoadingState.loading)
            Container(
              padding: const EdgeInsets.symmetric(vertical: ZAppSize.s8),
              color: ZAppColor.whiteColor,
              child: const ZCustomLoadingIndicator(color: ZAppColor.primary),
            ),
        ],
      ),
    );
  }
}
