import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/creator/explore/explore.dart';
import 'package:zeazn_invest_app/features/supporter/explore/explore.dart';
import 'package:zeazn_invest_app/features/supporter/explore/presentation/widgets/reward.tier.widget.dart';
import 'package:zeazn_invest_app/routes/app.pages.dart';
import 'package:zeazn_invest_app/shared/shared.dart';

class ZExplorePage extends StatelessWidget {
  ZExplorePage({super.key});

  final ctrl = Get.put(ZSExploreVM());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ZAppSize.s16.verticalSpace,
        ZPageTagWidget(
          tag: 'campaign_overview'.tr,
          width: ZDeviceUtil.getDeviceWidth(context),
        ),
        ZAppSize.s16.verticalSpace,
        // search fields
        Obx(
          () => Expanded(
            child: ctrl.supportType.value == SupportType.two
                ? ZRewardTierWidget(ctrl: ctrl).scrollable()
                : Column(
                    children: [
                      ZCustomFilterField(
                        onSearchTap: () {},
                        onFilterTap: () {
                          showTopModal(context, ZFilterTopModal(ctrl: ctrl));
                        },
                      ),
                      ZAppSize.s16.verticalSpace,
                      Expanded(
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Expanded(
                                  child: RefreshIndicator.adaptive(
                                    backgroundColor: ZAppColor.primary,
                                    color: ZAppColor.whiteColor,
                                    onRefresh: () =>
                                        ctrl.getAllProjects(context: context),
                                    child:
                                        ctrl.loading.value ==
                                            LoadingState.loading
                                        ? ListView.builder(
                                            itemCount: 10,
                                            physics:
                                                AlwaysScrollableScrollPhysics(),
                                            itemBuilder: (context, index) {
                                              return ZProjectListWidgetRedact(
                                                loading: ctrl.loading.value,
                                                ctrl: ctrl,
                                              );
                                            },
                                          )
                                        : ctrl.projects.isEmpty
                                        ? ZEmptyProjectState(
                                            child: Text(
                                              'no_projects_investor_msg'.tr,
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineSmall
                                                  ?.copyWith(
                                                    color: ZAppColor.blackColor,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                            ),
                                          ).scrollable(
                                            physics:
                                                AlwaysScrollableScrollPhysics(),
                                          )
                                        : ZAnimatedListView<Project>(
                                            scrollController:
                                                ctrl.projectScrollController,
                                            physics:
                                                AlwaysScrollableScrollPhysics(),
                                            child: (index, project) =>
                                                ZTrendingProjectWidget(
                                                  supportValue: '\$100.00',
                                                  project: project,
                                                  onSupportTap: () {
                                                    ZHelperFunction.switchScreen(
                                                      destination: Routes
                                                          .chooseSupportTypePage,
                                                      args: project,
                                                    );
                                                  },
                                                  onVideoProfileTap: () {
                                                    ZHelperFunction.switchScreen(
                                                      destination: Routes
                                                          .videoProfilePage,
                                                    );
                                                  },
                                                  onProfileTap: () {
                                                    ZHelperFunction.switchScreen(
                                                      destination:
                                                          Routes.profilePage,
                                                      args: [
                                                        ZSecureStorage()
                                                            .getAuthResponse()
                                                            ?.role,
                                                        project.creator?.id,
                                                      ],
                                                    );
                                                  },
                                                  onTap: () {
                                                    ZHelperFunction.switchScreen(
                                                      destination: Routes
                                                          .projectDetailPage,
                                                      args: project,
                                                    );
                                                  },
                                                ),
                                            items: ctrl.projects,
                                          ),
                                  ),
                                ),
                                // load more here
                                if (ctrl.loadingMore.value ==
                                    LoadingState.loading)
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: ZAppSize.s8,
                                    ),
                                    color: ZAppColor.whiteColor,
                                    child: const ZCustomLoadingIndicator(
                                      color: ZAppColor.primary,
                                    ),
                                  ),
                              ],
                            ),
                            Positioned(
                              bottom: 10,
                              right: 10,
                              child: FloatingActionButton.extended(
                                onPressed: () => ZHelperFunction.switchScreen(
                                  destination: Routes.reportPage,
                                ),
                                elevation: 0,
                                backgroundColor: ZAppColor.whiteColor,
                                label: Text(
                                  'feedback_report'.tr,
                                  style: Theme.of(context).textTheme.bodySmall
                                      ?.copyWith(color: ZAppColor.primary),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ],
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
