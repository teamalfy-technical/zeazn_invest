import 'package:flutter/material.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';

class ZSliderTheme {
  ZSliderTheme._();

  static SliderThemeData lightSliderTheme = SliderThemeData(
    trackHeight: ZAppSize.s20,
    trackShape: const RoundedRectSliderTrackShape(),
    activeTrackColor: ZAppColor.primary,
    inactiveTrackColor: ZAppColor.text50,
    thumbShape: const RoundSliderThumbShape(
      enabledThumbRadius: ZAppSize.s14,
      pressedElevation: ZAppSize.s8,
    ),
    thumbColor: ZAppColor.text500,
    overlayColor: ZAppColor.text500.withOpacityExt(ZAppSize.s0_2),
    overlayShape: const RoundSliderOverlayShape(overlayRadius: ZAppSize.s32),
    tickMarkShape: const RoundSliderTickMarkShape(),
    activeTickMarkColor: ZAppColor.whiteColor,
    inactiveTickMarkColor: ZAppColor.text100,
    valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
    valueIndicatorColor: ZAppColor.blackColor,
    valueIndicatorTextStyle: const TextStyle(
      color: ZAppColor.whiteColor,
      fontSize: ZAppSize.s20,
    ),
  );

  static SliderThemeData darkSliderTheme = SliderThemeData(
    trackHeight: ZAppSize.s20,
    trackShape: const RoundedRectSliderTrackShape(),
    activeTrackColor: ZAppColor.text700,
    inactiveTrackColor: ZAppColor.text300,
    thumbShape: const RoundSliderThumbShape(
      enabledThumbRadius: ZAppSize.s20,
      pressedElevation: ZAppSize.s8,
    ),
    thumbColor: ZAppColor.primary,
    thumbSize: WidgetStatePropertyAll(Size(ZAppSize.s50, ZAppSize.s50)),
    overlayColor: ZAppColor.text500.withOpacityExt(ZAppSize.s0_2),
    overlayShape: const RoundSliderOverlayShape(overlayRadius: ZAppSize.s32),
    tickMarkShape: RoundSliderTickMarkShape(),
    activeTickMarkColor: ZAppColor.text200,
    inactiveTickMarkColor: ZAppColor.text100,
    showValueIndicator: ShowValueIndicator.always,
    valueIndicatorShape: PaddleSliderValueIndicatorShape(),
    valueIndicatorColor: ZAppColor.primary,
    valueIndicatorTextStyle: const TextStyle(
      color: ZAppColor.whiteColor,
      fontSize: ZAppSize.s16,
    ),
  );
}
