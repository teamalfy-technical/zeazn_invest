import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/creator/insights/insights.dart';
import 'package:zeazn_invest_app/features/supporter/insights/insights.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';
import 'package:zeazn_invest_app/routes/app.pages.dart';
import 'package:zeazn_invest_app/shared/shared.dart';

class ZTopPerformingCampaignsPage extends StatelessWidget {
  ZTopPerformingCampaignsPage({super.key});

  final ctrl = Get.put(ZInsightsVM());

  @override
  Widget build(BuildContext context) {
    return ZZeaznScaffold(
      backgroundColor: ZAppColor.offWhiteColor,
      logoPath: Assets.icons.logoDark.svg(height: ZAppSize.s55),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () =>
            ZHelperFunction.switchScreen(destination: Routes.reportPage),
        elevation: 0,
        backgroundColor: ZAppColor.whiteColor,
        label: Text(
          'feedback_report'.tr,
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: ZAppColor.primary),
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ZAppSize.s8.verticalSpace,
          Icon(
            Icons.arrow_back_ios,
            color: ZAppColor.blackColor,
          ).onPressed(onTap: () => ZHelperFunction.pop()),

          ZAppSize.s14.verticalSpace,

          ZPageTagWidget(
            tag: 'top_performing_campaigns'.tr,
            width: ZDeviceUtil.getDeviceWidth(context),
          ),

          ZAppSize.s14.verticalSpace,

          Expanded(
            child: ListView.builder(
              itemCount: ctrl.projects.take(2).toList().length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final project = ctrl.projects.take(2).toList()[index];
                return ZPerformingCampaignWidget(
                  project: project,
                  ctrl: ctrl,
                  onRateTap: () {
                    ZHelperFunction.switchScreen(
                      destination: Routes.rateProjectPage,
                      args: project,
                    );
                  },
                  onFavouriteTap: () {},
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
      ),
    );
  }
}
