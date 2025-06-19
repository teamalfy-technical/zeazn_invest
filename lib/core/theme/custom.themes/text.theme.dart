import 'package:flutter/material.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';

class ZTextTheme {
  ZTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    // HeadLine Textstyles
    headlineLarge: const TextStyle().copyWith(
      fontSize: ZAppSize.s32,
      fontWeight: FontWeight.bold,
      color: ZAppColor.textColorDark,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: ZAppSize.s24,
      fontWeight: FontWeight.bold,
      color: ZAppColor.textColorDark,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: ZAppSize.s18,
      fontWeight: FontWeight.w600,
      color: ZAppColor.textColorDark,
    ),

    // Title Textstyles
    titleLarge: const TextStyle().copyWith(
      fontSize: ZAppSize.s16,
      fontWeight: FontWeight.w700,
      color: ZAppColor.textColorDark,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: ZAppSize.s16,
      fontWeight: FontWeight.w600,
      color: ZAppColor.textColorDark,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: ZAppSize.s16,
      fontWeight: FontWeight.w400,
      color: ZAppColor.textColorLight,
    ),

    // Body Textstyles
    bodyLarge: const TextStyle().copyWith(
      fontSize: ZAppSize.s16,
      fontWeight: FontWeight.w400,
      color: ZAppColor.textColorDark,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: ZAppSize.s15,
      fontWeight: FontWeight.normal,
      color: ZAppColor.textColorLight,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: ZAppSize.s14,
      fontWeight: FontWeight.w400,
      color: ZAppColor.textColorLight,
    ),

    // Label Textstyles
    labelLarge: const TextStyle().copyWith(
      fontSize: ZAppSize.s12,
      fontWeight: FontWeight.normal,
      color: ZAppColor.textColorLight,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: ZAppSize.s12,
      fontWeight: FontWeight.normal,
      color: ZAppColor.textColorLight,
    ),
    //labelSmall: const TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.black.withOpacityExt(0.5)),
  );
  static TextTheme darkTextTheme = TextTheme(
    // HeadLine Textstyles
    headlineLarge: const TextStyle().copyWith(
      fontSize: ZAppSize.s32,
      fontWeight: FontWeight.bold,
      color: ZAppColor.whiteTextColor,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: ZAppSize.s24,
      fontWeight: FontWeight.bold,
      color: ZAppColor.whiteTextColor,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: ZAppSize.s18,
      fontWeight: FontWeight.w600,
      color: ZAppColor.whiteTextColor,
    ),

    // Title Textstyles
    titleLarge: const TextStyle().copyWith(
      fontSize: ZAppSize.s16,
      fontWeight: FontWeight.w700,
      color: ZAppColor.whiteTextColor,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: ZAppSize.s16,
      fontWeight: FontWeight.w600,
      color: ZAppColor.whiteTextColor,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: ZAppSize.s16,
      fontWeight: FontWeight.w400,
      color: ZAppColor.whiteTextColor,
    ),

    // Body Textstyles
    bodyLarge: const TextStyle().copyWith(
      fontSize: ZAppSize.s16,
      fontWeight: FontWeight.w500,
      color: ZAppColor.whiteTextColor,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: ZAppSize.s15,
      fontWeight: FontWeight.normal,
      color: ZAppColor.whiteTextColor,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: ZAppSize.s14,
      fontWeight: FontWeight.w500,
      color: ZAppColor.whiteTextColor,
    ),

    // Label Textstyles
    labelLarge: const TextStyle().copyWith(
      fontSize: ZAppSize.s12,
      fontWeight: FontWeight.normal,
      color: ZAppColor.whiteTextColor,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: ZAppSize.s12,
      fontWeight: FontWeight.normal,
      color: ZAppColor.whiteTextColor,
    ),
    //labelSmall: const TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.white.withOpacityExt(0.5)),
  );
}
