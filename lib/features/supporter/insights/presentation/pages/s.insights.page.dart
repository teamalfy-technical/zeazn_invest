import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/creator/insights/presentation/vm/insights.vm.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';
import 'package:zeazn_invest_app/routes/app.pages.dart';
import 'package:zeazn_invest_app/shared/shared.dart';

class ZSupporterInsightsPage extends StatelessWidget {
  ZSupporterInsightsPage({super.key});

  final ctrl = Get.put(ZInsightsVM());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ZAppColor.offWhiteColor,

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ZAppSize.s16.verticalSpace,
          // Analysis container widget
          Container(
            padding: EdgeInsets.all(ZAppSize.s20),
            decoration: BoxDecoration(
              color: ZAppColor.blackColor,
              borderRadius: BorderRadius.circular(ZAppSize.s20),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: ZAppSize.s25,
                  backgroundImage: AssetImage(Assets.images.slideTwo.path),
                ),
                ZAppSize.s8.horizontalSpace,
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'analysis'.tr,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      ZAppSize.s8.verticalSpace,
                      Text(
                        'analysis_hint_1'.tr,
                        textAlign: TextAlign.center,
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall?.copyWith(fontSize: ZAppSize.s10),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ZAppSize.s16.verticalSpace,
          // Creator ID Tag widget
          ZPageTagWidget(
            tag: '${'supporter_id'.tr}: 3884748',
            width: ZDeviceUtil.getDeviceWidth(context) * 0.70,
          ),

          ZAppSize.s16.verticalSpace,

          // Performing campaigns widget
          ZInsightOptionWidget(
            label: 'performing_overview'.tr,
            image: Assets.images.slideTwo.path,
            onTap:
                () => ZHelperFunction.switchScreen(
                  destination: Routes.performanceOverviewPage,
                ),
          ),
          ZAppSize.s16.verticalSpace,
          ZInsightOptionWidget(
            label: 'top_performing_campaigns'.tr,
            image: Assets.images.slideThree.path,
            onTap:
                () => ZHelperFunction.switchScreen(
                  destination: Routes.topPerformingCampaignPage,
                ),
          ),
        ],
      ),
    );
  }
}
