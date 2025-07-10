import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/supporter/explore/explore.dart';
import 'package:zeazn_invest_app/routes/app.pages.dart';
import 'package:zeazn_invest_app/shared/shared.dart';

class ZMyCampaignPage extends StatelessWidget {
  ZMyCampaignPage({super.key});

  final ctrl = Get.put(ZSExploreVM());

  Widget _buildStatWidget({
    required BuildContext context,
    required String label,
    required int value,
  }) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            vertical: ZAppSize.s16,
            horizontal: ZAppSize.s26,
          ),
          // width: ZDeviceUtil.getDeviceWidth(context),
          decoration: BoxDecoration(
            color: ZAppColor.primary,
            borderRadius: BorderRadius.circular(ZAppSize.s10),
          ),
          child: Text(
            '$value',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: ZAppColor.blackColor,
              // fontSize: ZAppSize.s10,
            ),
          ),
        ),
        ZAppSize.s6.verticalSpace,
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w500,
            // // fontSize: ZAppSize.s10,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(ZAppSize.s16),
          width: ZDeviceUtil.getDeviceWidth(context),
          decoration: BoxDecoration(
            color: ZAppColor.blackColor,
            borderRadius: BorderRadius.circular(ZAppSize.s20),
          ),
          child: Row(
            children: [
              // profile section
              Column(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(ZAppSize.s12),
                    child: Image.network(
                      'https://picsum.photos/200',
                      fit: BoxFit.cover,
                      width: ZDeviceUtil.getDeviceWidth(context) * 0.21,
                    ),
                  ),
                  ZAppSize.s8.verticalSpace,
                  Text(
                    'profile'.tr,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w500,
                      // // fontSize: ZAppSize.s10,
                    ),
                  ),
                ],
              ).onPressed(
                onTap: () => ZHelperFunction.switchScreen(
                  destination: Routes.profilePage,
                  args: [ZSecureStorage().getAuthResponse()?.role, null],
                ),
              ),
              // stats layout
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'campaign_details'.tr,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w500,
                        // // fontSize: ZAppSize.s10,
                      ),
                    ),
                    ZAppSize.s6.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildStatWidget(
                          context: context,
                          label: 'docs'.tr,
                          value: 4,
                        ),
                        ZAppSize.s6.horizontalSpace,
                        _buildStatWidget(
                          context: context,
                          label: 'chats'.tr,
                          value: 2,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        ZAppSize.s16.verticalSpace,
        ZPageTagWidget(
          tag: 'supported_campaign_overview'.tr,
          width: ZDeviceUtil.getDeviceWidth(context),
        ),
        ZAppSize.s16.verticalSpace,
        // search fields
        ZCustomFilterField(onSearchTap: () {}, onFilterTap: () {}),
        ZAppSize.s16.verticalSpace,
        Expanded(
          child: ListView.builder(
            itemCount: ctrl.projects.length,
            itemBuilder: (context, index) {
              final project = ctrl.projects[index];
              return ZMyCampaignWidget(
                project: project,
                ctrl: ctrl,
                onChatTap: () => ZHelperFunction.switchScreen(
                  destination: Routes.chatPage,
                  args: true,
                ),
                onTap: () {
                  // ZHelperFunction.switchScreen(
                  //   destination: Routes.projectDetailPage,
                  //   args: project,
                  // );
                },
              );
            },
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
