import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/creator/insights/presentation/vm/insights.vm.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';
import 'package:zeazn_invest_app/routes/app.pages.dart';

class ZInsightsPage extends StatelessWidget {
  ZInsightsPage({super.key});

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
                        'analysis_hint'.tr,
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
          Container(
            padding: EdgeInsets.all(ZAppSize.s8),
            width: ZDeviceUtil.getDeviceWidth(context) * 0.70,
            decoration: BoxDecoration(
              color: ZAppColor.blackColor,
              borderRadius: BorderRadius.circular(ZAppSize.s4),
            ),
            child: Text(
              '${'creator_id'.tr}: 3884748',
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontSize: ZAppSize.s13),
            ),
          ).centered(),

          ZAppSize.s16.verticalSpace,
          // Performing campaigns widget
          Container(
            padding: EdgeInsets.all(ZAppSize.s12),
            decoration: BoxDecoration(
              color: ZAppColor.blackColor,
              borderRadius: BorderRadius.circular(ZAppSize.s12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // CircleAvatar(
                //   radius: ZAppSize.s25,
                //   backgroundImage: AssetImage(Assets.images.slideTwo.path),
                // ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(ZAppSize.s10),
                  child: Image.asset(
                    Assets.images.slideTwo.path,
                    fit: BoxFit.cover,
                    width: ZAppSize.s60,
                    height: ZAppSize.s50,
                  ),
                ),
                ZAppSize.s8.horizontalSpace,
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'performing_campaigns'.tr,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      ZAppSize.s8.horizontalSpace,
                      Assets.icons.arrowRightIcon.svg(
                        color: ZAppColor.whiteColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ).onPressed(
            onTap:
                () => ZHelperFunction.switchScreen(
                  destination: Routes.insightsDetailPage,
                ),
          ),
        ],
      ),
    );
  }
}
