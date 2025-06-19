import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';

class ZCustomPinput extends StatelessWidget {
  final Function(String) onCompleted;
  final int length;
  final PinputAutovalidateMode pinputAutovalidateMode;
  ZCustomPinput({
    super.key,
    required this.onCompleted,
    this.pinputAutovalidateMode = PinputAutovalidateMode.onSubmit,
    this.length = 6,
  });

  final defaultPinTheme = PinTheme(
    width: ZAppSize.s80,
    height: ZAppSize.s80,
    margin: EdgeInsets.symmetric(horizontal: ZAppSize.s2),
    textStyle: TextStyle(
      fontSize: ZAppSize.s18,
      // color: Color.fromRGBO(30, 60, 87, 1),
      fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      color: ZAppColor.blackColorDark,
      // border: Border.none,
      borderRadius: BorderRadius.circular(ZAppSize.s5),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: ZAppColor.primary),
      borderRadius: BorderRadius.circular(ZAppSize.s10),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: ZAppColor.blackColorDark,
      ),
    );
    return Pinput(
      length: length,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      pinputAutovalidateMode: pinputAutovalidateMode,
      showCursor: true,
      onCompleted: onCompleted,
      // (pin) => oldmutualLogger.d(pin),
    );
  }
}
