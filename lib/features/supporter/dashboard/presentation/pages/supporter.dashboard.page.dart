import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/creator/chat/presentation/pages/chat.page.dart';
import 'package:zeazn_invest_app/features/supporter/campaign/presentation/pages/my.campaign.page.dart';
import 'package:zeazn_invest_app/features/supporter/dashboard/dashboard.dart';
import 'package:zeazn_invest_app/features/supporter/explore/presentation/pages/explore.page.dart';
import 'package:zeazn_invest_app/features/supporter/insights/presentation/pages/s.insights.page.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';
import 'package:zeazn_invest_app/shared/shared.dart';

class ZSupporterDashboardPage extends StatelessWidget {
  ZSupporterDashboardPage({super.key});

  final ctrl = Get.put(ZSupporterDashboardVm());

  final List<Widget> _pages = [
    ZExplorePage(),
    ZMyCampaignPage(),
    ZSupporterInsightsPage(),
    ZChatPage(isPop: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
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
                icon: Assets.icons.campaignIcon.svg(
                  // width: ZAppSize.s28,
                  // height: ZAppSize.s28,
                ),
                label: 'my_campaign'.tr,
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
    );
  }
}
