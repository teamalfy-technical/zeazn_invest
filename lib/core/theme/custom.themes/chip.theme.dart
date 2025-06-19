import 'package:flutter/material.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';

/// -- Light & Dark Chip Themes
class ZChipTheme {
  ZChipTheme._();

  /// -- Light Theme
  static ChipThemeData lightChipThemeData = ChipThemeData(
    disabledColor: ZAppColor.greyColor.withOpacityExt(ZAppSize.s0_4),
    labelStyle: const TextStyle(color: ZAppColor.blackColor),
    selectedColor: ZAppColor.primary,
    padding: const EdgeInsets.symmetric(
      horizontal: ZAppSize.s12,
      vertical: ZAppSize.s12,
    ),
    checkmarkColor: ZAppColor.whiteColor,
  );

  /// -- Dark Theme
  static ChipThemeData darkChipThemeData = const ChipThemeData(
    disabledColor: ZAppColor.greyColor,
    labelStyle: TextStyle(color: ZAppColor.whiteColor),
    selectedColor: ZAppColor.primary,
    padding: EdgeInsets.symmetric(
      horizontal: ZAppSize.s12,
      vertical: ZAppSize.s12,
    ),
    checkmarkColor: ZAppColor.whiteColor,
  );
}
