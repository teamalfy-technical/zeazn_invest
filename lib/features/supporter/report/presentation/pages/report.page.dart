import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/creator/insights/insights.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';
import 'package:zeazn_invest_app/routes/app.pages.dart';
import 'package:zeazn_invest_app/shared/shared.dart';

class ZReportPage extends StatelessWidget {
  ZReportPage({super.key});

  final ctrl = Get.put(ZInsightsVM());

  @override
  Widget build(BuildContext context) {
    return ZZeaznScaffold(
      backgroundColor: ZAppColor.offWhiteColor,
      logoPath: Assets.icons.logoDark.svg(height: ZAppSize.s55),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ZAppSize.s8.verticalSpace,
          Align(
            alignment: Alignment.topLeft,
            child: Icon(
              Icons.arrow_back_ios,
              color: ZAppColor.blackColor,
            ).onPressed(onTap: () => ZHelperFunction.pop()),
          ),

          ZAppSize.s10.verticalSpace,

          Expanded(
            child:
                Column(
                  children: [
                    Text(
                      'chat_with_support'.tr,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: ZAppSize.s20,
                        color: ZAppColor.text500,
                        letterSpacing: ZAppSize.s2,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    ZAppSize.s32.verticalSpace,

                    Text(
                      'report_title'.tr,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: ZAppSize.s20,
                        color: ZAppColor.blackColor,
                        letterSpacing: ZAppSize.s2,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    ZAppSize.s10.verticalSpace,

                    Text(
                      'report_msg'.tr,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontSize: ZAppSize.s14,
                        color: ZAppColor.blackColor,
                        letterSpacing: ZAppSize.s1,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    // envelope icon
                    ZAppSize.s45.verticalSpace,

                    Container(
                      padding: EdgeInsets.all(ZAppSize.s20),
                      decoration: BoxDecoration(
                        color: ZAppColor.primary,
                        borderRadius: BorderRadius.circular(ZAppSize.s20),
                      ),
                      child: Assets.icons.envelopeIcon.svg(),
                    ),

                    ZAppSize.s45.verticalSpace,

                    Text(
                      'send_us_an_email'.tr,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontSize: ZAppSize.s15,
                        color: ZAppColor.blackColor,
                        letterSpacing: ZAppSize.s2,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    ZAppSize.s4.verticalSpace,

                    Text(
                      '@customerchatbot.io',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontSize: ZAppSize.s15,
                        color: ZAppColor.blackColor,

                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    ZAppSize.s32.verticalSpace,

                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: ZAppSize.s6,
                        horizontal: ZAppSize.s14,
                      ),
                      width: ZDeviceUtil.getDeviceWidth(context) * 0.75,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: ZAppSize.s1,
                          color: ZAppColor.blackColor,
                        ),
                        borderRadius: BorderRadius.circular(ZAppSize.s16),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Assets.icons.wechatLogo.svg(),
                          Text(
                            'contact_live_chat'.tr,
                            textAlign: TextAlign.center,
                            style: Theme.of(
                              context,
                            ).textTheme.titleSmall?.copyWith(
                              fontSize: ZAppSize.s15,
                              color: ZAppColor.blackColor,
                              letterSpacing: ZAppSize.s1,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Assets.icons.arrowForwardIos.svg(),
                        ],
                      ),
                    ).onPressed(
                      onTap:
                          () => ZHelperFunction.switchScreen(
                            destination: Routes.sendReportPage,
                          ),
                    ),
                  ],
                ).scrollable(),
          ),

          // live chat button
        ],
      ),
    );
  }
}
