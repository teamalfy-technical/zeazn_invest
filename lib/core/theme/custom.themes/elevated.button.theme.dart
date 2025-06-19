import 'package:flutter/material.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';

/// -- Light & Dark Elevated Button Themes
class ZElevatedButtonTheme {
  ZElevatedButtonTheme._();

  /// -- Light Theme
  static final ElevatedButtonThemeData lightElevatedButtonTheme =
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: ZAppSize.s0,
          foregroundColor: ZAppColor.whiteColor,
          backgroundColor: ZAppColor.primary,
          disabledForegroundColor: ZAppColor.greyColor,
          disabledBackgroundColor: ZAppColor.greyColor,
          side: const BorderSide(color: ZAppColor.primary),
          minimumSize: const Size.fromHeight(ZAppSize.buttonHeight),
          // padding: const EdgeInsets.symmetric(
          //     vertical: TAppSize.s18, horizontal: TAppSize.s20),
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

  /// -- Dark Theme
  static final ElevatedButtonThemeData darkElevatedButtonTheme =
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: ZAppSize.s0,
          foregroundColor: ZAppColor.blackColor,
          backgroundColor: ZAppColor.primary,
          disabledForegroundColor: ZAppColor.greyColor,
          disabledBackgroundColor: ZAppColor.greyColor,
          side: const BorderSide(color: ZAppColor.primary),
          minimumSize: const Size.fromHeight(ZAppSize.buttonHeight),
          padding: const EdgeInsets.symmetric(
            vertical: ZAppSize.s18,
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
}
