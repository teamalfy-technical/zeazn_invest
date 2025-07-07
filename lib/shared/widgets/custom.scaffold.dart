import 'package:flutter/material.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';

class ZCustomScaffold extends StatelessWidget {
  final Widget child;
  final double? top;
  //final bool showSignInLink;
  const ZCustomScaffold({
    super.key,
    required this.child,
    this.top,
    // this.showSignInLink = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: ZDeviceUtil.getDeviceHeight(context) * 0.08,
            left: ZDeviceUtil.getDeviceWidth(context) * 0.1,
            child: Assets.icons.loveSmIcon.svg(),
          ),
          Positioned(
            top: ZDeviceUtil.getDeviceHeight(context) * 0.18,
            left: ZDeviceUtil.getDeviceWidth(context) * 0.25,
            child: Assets.icons.loveLgIcon.svg(),
          ),

          // Positioned(
          //   top: ZDeviceUtil.getDeviceHeight(context) * 0.24,
          //   right: ZDeviceUtil.getDeviceWidth(context) * 0.1,
          //   child: Assets.icons.loveSmIcon.svg(),
          // ),
          Positioned(
            bottom: ZDeviceUtil.getDeviceHeight(context) * 0.1,
            right: ZDeviceUtil.getDeviceWidth(context) * 0.1,
            child: Assets.icons.loveSmIcon.svg(),
          ),
          Positioned(
            bottom:
                //  showSignInLink ? ZDeviceUtil.getDeviceWidth(context) * 0.06 :
                0,
            right: ZDeviceUtil.getDeviceWidth(context) * 0.1,
            left: ZDeviceUtil.getDeviceWidth(context) * 0.1,
            child: Assets.icons.logoDark.svg(height: ZAppSize.s80),
          ),

          // showSignInLink
          //     ? Positioned(
          //       bottom: ZDeviceUtil.getDeviceWidth(context) * 0.02,
          //       right: ZDeviceUtil.getDeviceWidth(context) * 0.1,
          //       left: ZDeviceUtil.getDeviceWidth(context) * 0.1,
          //       child: ZAuthLinkButton(
          //         title: '${'already_have_account'.tr} ',
          //         subtitle: 'sign_in'.tr,
          //         subtitleColor: ZAppColor.primary,
          //         onTap:
          //             () => ZHelperFunction.switchScreen(
          //               destination: Routes.loginPage,
          //             ),
          //       ),
          //     )
          //     : Align(
          //       alignment: Alignment.bottomCenter,
          //       child: SizedBox.shrink(),
          //     ),

          // form
          Positioned(
            top: top ?? ZDeviceUtil.getDeviceHeight(context) * 0.32,
            bottom: 0,
            left: 0,
            right: 0,
            // alignment: Alignment.center,
            child: child,
          ),
        ],
      ),
    );
  }
}
