import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/creator/explore/explore.dart';
import 'package:zeazn_invest_app/routes/app.pages.dart';
import 'package:zeazn_invest_app/shared/shared.dart';

class ZTrendingProjectsTab extends StatelessWidget {
  ZTrendingProjectsTab({super.key});

  final ctrl = Get.put(ZExploreVM());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          // search fields
          ZCustomFilterField(
            onSearchTap: () {},
            onFilterTap: () {
              showTopModal(context, ZFilterTopModal(ctrl: ctrl));
            },
          ),
          ZAppSize.s16.verticalSpace,
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: RefreshIndicator.adaptive(
                    backgroundColor: ZAppColor.primary,
                    onRefresh: () =>
                        ctrl.getAllProjectsByCreator(context: context),
                    color: ZAppColor.whiteColor,
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
                            scrollController: ctrl.trendingScrollController,
                            child: (index, project) => ZTrendingProjectWidget(
                              project: project,
                              onVideoProfileTap: () =>
                                  ZHelperFunction.switchScreen(
                                    destination: Routes.videoProfilePage,
                                  ),
                              onProfileTap: () {
                                ZHelperFunction.switchScreen(
                                  destination: Routes.profilePage,
                                  args: [
                                    ZSecureStorage().getAuthResponse()?.role,
                                    project.creator?.id,
                                  ],
                                );
                              },
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
                    child: const ZCustomLoadingIndicator(
                      color: ZAppColor.primary,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showTopModal(BuildContext context, Widget child) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "TopModal",
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Align(
          alignment: Alignment.topCenter,
          child: Material(color: Colors.transparent, child: child),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, widget) {
        final curvedValue = Curves.easeInOut.transform(animation.value);
        return Transform.translate(
          offset: Offset(0, -200 + (200 * curvedValue)), // slide in from top
          child: Opacity(opacity: animation.value, child: widget),
        );
      },
    );
  }
}
