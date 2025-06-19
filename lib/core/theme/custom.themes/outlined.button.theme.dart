import 'package:flutter/material.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';

/// -- Light & Dark Outlined Button Themes
class ZOutlinedButtonTheme {
  ZOutlinedButtonTheme._();

  /// -- Light Theme
  static final OutlinedButtonThemeData lightOutlinedButtonTheme =
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          elevation: ZAppSize.s0,
          foregroundColor: ZAppColor.blackColor,
          side: const BorderSide(color: ZAppColor.primary),
          padding: const EdgeInsets.symmetric(
            vertical: ZAppSize.s16,
            horizontal: ZAppSize.s20,
          ),
          textStyle: const TextStyle(
            fontSize: ZAppSize.s16,
            color: ZAppColor.blackColor,
            fontWeight: FontWeight.w600,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ZAppSize.s8),
          ),
        ),
      );

  /// -- Dark Theme
  static final OutlinedButtonThemeData darkOutlinedButtonTheme =
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          elevation: ZAppSize.s0,
          foregroundColor: ZAppColor.whiteColor,
          side: const BorderSide(color: ZAppColor.primary),
          padding: const EdgeInsets.symmetric(
            vertical: ZAppSize.s16,
            horizontal: ZAppSize.s20,
          ),
          textStyle: const TextStyle(
            fontSize: ZAppSize.s16,
            color: ZAppColor.whiteColor,
            fontWeight: FontWeight.w600,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ZAppSize.s8),
          ),
        ),
      );
}
