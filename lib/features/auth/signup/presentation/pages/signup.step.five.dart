import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/auth/signup/presentation/vm/signup.vm.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';
import 'package:zeazn_invest_app/routes/app.pages.dart';
import 'package:zeazn_invest_app/shared/widgets/custom.button.right.dart';

class ZSignupStep5 extends StatelessWidget {
  ZSignupStep5({super.key});

  final ctrl = Get.find<ZSignupVm>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: false,
        left: false,
        right: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child:
                  Column(
                    children: [
                      ZAppSize.s20.verticalSpace,
                      Text(
                        'security_compliance_title'.tr,
                        textAlign: TextAlign.start,
                        style: Theme.of(
                          context,
                        ).textTheme.headlineMedium?.copyWith(
                          color: ZAppColor.whiteColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      ZAppSize.s26.verticalSpace,
                      Text(
                        'security_compliance_desc'.tr,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: ZAppColor.whiteColor,
                          height: 1.3,
                          fontSize: ZAppSize.s18,
                          fontWeight: FontWeight.w400,
                        ),
                      ).symmetric(horizontal: ZAppSize.s22),
                      ZAppSize.s18.verticalSpace,

                      Image.asset(Assets.images.complianceBg.path),
                      ZAppSize.s20.verticalSpace,
                      Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          width: ZDeviceUtil.getDeviceWidth(context) * 0.44,
                          child: ZCustomButtonRight(
                            label: 'next'.tr.toUpperCase(),
                            onTap:
                                () => ZHelperFunction.switchScreen(
                                  destination: Routes.signupStep6,
                                ),
                            backgroundColor: ZAppColor.primary,
                            borderColor: ZAppColor.primary,
                          ),
                        ),
                      ).symmetric(horizontal: ZAppSize.s22),

                      ZAppSize.s26.verticalSpace,
                    ],
                  ).scrollable(),
            ),

            Image.asset(Assets.images.logoDark.path),

            ZAppSize.s16.verticalSpace,
          ],
        ),
      ),
    );
  }
}
