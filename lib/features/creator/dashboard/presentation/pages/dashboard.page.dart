import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/creator/chat/presentation/pages/chat.page.dart';
import 'package:zeazn_invest_app/features/creator/dashboard/dashboard.dart';
import 'package:zeazn_invest_app/features/creator/explore/presentation/pages/explore.page.dart';
import 'package:zeazn_invest_app/features/creator/insights/insights.dart';
import 'package:zeazn_invest_app/features/creator/profile/profile.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';
import 'package:zeazn_invest_app/shared/shared.dart';

class ZDashboardPage extends StatelessWidget {
  ZDashboardPage({super.key});

  final ctrl = Get.put(ZDashboardVm());

  final List<Widget> _pages = [
    ZExplorePage(),
    ZProfilePage(role: UserRole.other, userId: null),
    ZInsightsPage(),
    ZChatPage(isPop: false),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Obx(
        () => ZZeaznScaffold(
          backgroundColor: ZAppColor.offWhiteColor,
          logoPath: Assets.icons.logoDark.svg(height: ZAppSize.s55),
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.circular(ZAppSize.s38),
            child: NavigationBar(
              selectedIndex: ctrl.currentIndex.value,
              onDestinationSelected: ctrl.onPageChanged,
              indicatorShape: CustomIndicatorShape(),
              indicatorColor: ZAppColor.primary,
              labelPadding: EdgeInsets.only(top: ZAppSize.s8),
              destinations: [
                NavigationDestination(
                  icon: Assets.icons.exploreIcon.svg(
                    width: ZAppSize.s28,
                    height: ZAppSize.s28,
                  ),
                  label: 'explore'.tr,
                ),
                NavigationDestination(
                  icon: Assets.icons.profileIcon.svg(
                    // width: ZAppSize.s28,
                    // height: ZAppSize.s28,
                  ),
                  label: 'profile'.tr,
                ),
                NavigationDestination(
                  icon: Assets.icons.insightsIcon.svg(
                    width: ZAppSize.s28,
                    height: ZAppSize.s28,
                  ),
                  label: 'insights'.tr,
                ),
                NavigationDestination(
                  icon: Assets.icons.chatIcon.svg(
                    width: ZAppSize.s28,
                    height: ZAppSize.s28,
                  ),
                  label: 'chat'.tr,
                ),
              ],
            ),
          ).symmetric(horizontal: ZAppSize.s18, vertical: ZAppSize.s10),
          child: _pages[ctrl.currentIndex.value],
        ),
      ),
    );
  }
}
