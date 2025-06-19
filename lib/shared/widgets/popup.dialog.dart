import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';

import '../../gen/assets.gen.dart';

class ZPopupDialog {
  ZPopupDialog(this.context);
  final BuildContext context;

  void successMessage({
    required String title,
    required String message,
    int? duration,
  }) {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.GROUNDED,
      backgroundColor:
          ZHelperFunction.isDarkMode(context)
              ? ZAppColor.lightBlackColor
              : ZAppColor.success50,
      icon: const Padding(
        padding: EdgeInsets.symmetric(horizontal: ZAppSize.s16),
        child: Icon(
          Icons.check_circle,
          color: ZAppColor.success700,
          size: ZAppSize.s22,
        ),
      ),
      messageColor: ZAppColor.success700,
      message: message,
      duration: Duration(milliseconds: duration ?? ZAppSize.s2500),
    ).show(context);
  }

  void errorMessage({required String title, required String message}) {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.GROUNDED,
      backgroundColor:
          ZHelperFunction.isDarkMode(context)
              ? ZAppColor.lightBlackColor
              : ZAppColor.whiteColor,
      icon: Assets.icons.warningIcon.svg(
        color:
            ZHelperFunction.isDarkMode(context)
                ? ZAppColor.whiteColor
                : ZAppColor.blackColor,
      ),
      // leftBarIndicatorColor: PAppColor.errorColor,
      title: title,
      padding: EdgeInsets.all(ZAppSize.s20),
      titleSize: ZAppSize.s16,
      titleColor:
          ZHelperFunction.isDarkMode(context)
              ? ZAppColor.whiteColor
              : ZAppColor.blackColor,
      messageColor:
          ZHelperFunction.isDarkMode(context)
              ? ZAppColor.whiteColor
              : ZAppColor.blackColor,
      message: message,
      duration: const Duration(milliseconds: ZAppSize.s4000),
    ).show(context);
  }

  void warningMessage(String message) {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.GROUNDED,
      backgroundColor:
          ZHelperFunction.isDarkMode(context)
              ? ZAppColor.lightBlackColor
              : ZAppColor.warning50,
      icon: const Icon(
        Icons.error,
        color: ZAppColor.warning700,
        size: ZAppSize.s24,
      ),
      shouldIconPulse: false,
      messageColor: ZAppColor.warning700,
      message: message,
      duration: const Duration(milliseconds: ZAppSize.s3000),
    ).show(context);
  }

  void informationMessage(String message) {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.GROUNDED,
      backgroundColor:
          ZHelperFunction.isDarkMode(context)
              ? ZAppColor.lightBlackColor
              : ZAppColor.info50,
      icon: const Icon(
        Icons.error,
        color: ZAppColor.info700,
        size: ZAppSize.s24,
      ),
      shouldIconPulse: false,
      messageColor: ZAppColor.info700,
      message: message,
      duration: const Duration(milliseconds: ZAppSize.s5000),
    ).show(context);
  }

  void unVerifiedSnack() {
    // return PopupDialogs(context).snackPopup(
    //   status: RequestStatus.info,
    //   message: 'Verify your account to be able to perform this action.',
    // );
  }

  void comingSoonSnack([String? message]) {
    informationMessage('We are still baking this feature');
  }
}
