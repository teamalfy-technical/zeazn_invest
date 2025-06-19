import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/welcome/presentation/vm/splash.vm.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';
import 'package:zeazn_invest_app/routes/app.pages.dart';

class ZSplashPage extends StatelessWidget {
  ZSplashPage({super.key});

  final ctrl = Get.put(ZSplashVm());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Container(
      //   height: ZDeviceUtil.getDeviceHeight(context),
      //   decoration: BoxDecoration(
      //     image: DecorationImage(
      //       fit: BoxFit.cover,
      //       image: AssetImage(Assets.images.splashWholeBg.path),
      //     ),
      //   ),
      // ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(Assets.images.splashBg.path),
                ),
              ),
            ),
          ),

          Positioned(
            top: ZAppSize.s50,
            left: ZAppSize.s0,
            right: ZAppSize.s0,
            child: Assets.icons.logoLight.svg(height: ZAppSize.s50),

            // Image.asset(Assets.images.logoLight.path),
          ),

          Positioned(
            top: ZDeviceUtil.getDeviceHeight(context) * 0.35,
            left: ZAppSize.s0,
            right: ZAppSize.s0,
            // alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '"${'splash_title'.tr}"',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: ZAppColor.text50,
                    height: 0,
                    fontSize: ZAppSize.s48,
                  ),
                ),
                ZAppSize.s16.verticalSpace,
                Text(
                  '"${'splash_subtitle'.tr}"',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: ZAppColor.whiteColor,
                    fontSize: ZAppSize.s22,
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: ZAppSize.s5,
            right: ZAppSize.s5,
            bottom: ZAppSize.s0,
            child: Container(
              height: ZDeviceUtil.getDeviceHeight(context) * 0.3,
              decoration: BoxDecoration(
                color: Color(0XB2302F2F),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(ZAppSize.s20),
                  topRight: Radius.circular(ZAppSize.s20),
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Transform.scale(
                    scale: 0.80,
                    child: Assets.icons.splashBtIcon.svg(),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'next'.tr,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: ZAppColor.text700,
                        fontSize: ZAppSize.s22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ).onPressed(
              onTap:
                  () => ZHelperFunction.switchScreen(
                    destination: Routes.creatorOnboardingPage,
                    replace: true,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
