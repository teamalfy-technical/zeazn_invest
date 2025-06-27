import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/auth/signup/presentation/vm/signup.vm.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';
import 'package:zeazn_invest_app/routes/app.pages.dart';
import 'package:zeazn_invest_app/shared/widgets/custom.button.right.dart';

class ZSignupStep4 extends StatelessWidget {
  ZSignupStep4({super.key});

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
            ZAppSize.s20.verticalSpace,
            Expanded(
              child: Column(
                children: [
                  Text(
                    'id_card_verification'.tr,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: ZAppColor.whiteColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  ZAppSize.s26.verticalSpace,
                  Align(
                    alignment: Alignment.center,
                    child: ZCustomButtonRight(
                      label: 'let_do_it'.tr,
                      onTap:
                          () => ZHelperFunction.switchScreen(
                            destination: Routes.signupStep5,
                          ),
                      backgroundColor: ZAppColor.primary,
                      width: ZDeviceUtil.getDeviceWidth(context) * 0.47,
                      borderColor: ZAppColor.primary,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Image.asset(Assets.images.idCardBg.path),
                  Positioned(
                    bottom: 0, // ZDeviceUtil.getDeviceHeight(context) * 0.0,
                    right: ZDeviceUtil.getDeviceWidth(context) * 0.1,
                    left: ZDeviceUtil.getDeviceWidth(context) * 0.1,
                    child: Image.asset(Assets.images.logoDark.path),

                    //SvgPicture.asset('assets/icons/logo.dark.svg'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
