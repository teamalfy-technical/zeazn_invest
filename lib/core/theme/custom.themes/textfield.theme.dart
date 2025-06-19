import 'package:flutter/material.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';

/// -- Light & Dark Outlined Button Themes
class ZTextFormFieldTheme {
  ZTextFormFieldTheme._();

  /// -- Light Theme
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: ZAppColor.greyColor,
    suffixIconColor: ZAppColor.greyColor,
    focusColor: ZAppColor.primary,
    contentPadding: const EdgeInsets.symmetric(vertical: ZAppSize.s10),
    labelStyle: const TextStyle().copyWith(
      fontSize: ZAppSize.s16,
      color: ZAppColor.text300,
    ),
    hintStyle: const TextStyle().copyWith(
      fontSize: ZAppSize.s14,
      fontWeight: FontWeight.w500,
      color: ZAppColor.hintTextColor,
    ),
    errorStyle: const TextStyle().copyWith(
      fontStyle: FontStyle.normal,
      color: ZAppColor.alert500,
    ),
    floatingLabelStyle: const TextStyle().copyWith(
      color: ZAppColor.blackColor.withOpacityExt(ZAppSize.s0_8),
    ),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ZAppSize.s5),
      borderSide: const BorderSide(
        width: ZAppSize.s1,
        color: ZAppColor.fillColor,
      ),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ZAppSize.s5),
      borderSide: const BorderSide(
        width: ZAppSize.s1,
        color: ZAppColor.fillColor,
      ),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ZAppSize.s5),
      borderSide: const BorderSide(
        width: ZAppSize.s1,
        color: ZAppColor.primary,
      ),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ZAppSize.s5),
      borderSide: const BorderSide(
        width: ZAppSize.s1,
        color: ZAppColor.alert500,
      ),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ZAppSize.s5),
      borderSide: const BorderSide(
        width: ZAppSize.s1,
        color: ZAppColor.warning500,
      ),
    ),
  );

  /// -- Dark Theme
  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: ZAppColor.greyColor,
    suffixIconColor: ZAppColor.greyColor,
    focusColor: ZAppColor.primary,
    contentPadding: const EdgeInsets.symmetric(
      vertical: ZAppSize.s10,
      horizontal: ZAppSize.s10,
    ),
    labelStyle: const TextStyle().copyWith(
      fontSize: ZAppSize.s16,
      color: ZAppColor.text300,
    ),
    hintStyle: const TextStyle().copyWith(
      fontSize: ZAppSize.s14,
      fontWeight: FontWeight.w500,
      color: ZAppColor.hintTextColor,
    ),
    errorStyle: const TextStyle().copyWith(
      fontStyle: FontStyle.normal,
      color: ZAppColor.alert500,
    ),
    floatingLabelStyle: const TextStyle().copyWith(color: ZAppColor.text300),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ZAppSize.s5),
      borderSide: const BorderSide(
        width: ZAppSize.s1,
        color: ZAppColor.primary,
      ),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ZAppSize.s5),
      borderSide: const BorderSide(
        width: ZAppSize.s1,
        color: ZAppColor.primary,
      ),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ZAppSize.s5),
      borderSide: const BorderSide(
        width: ZAppSize.s1,
        color: ZAppColor.primary,
      ),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ZAppSize.s5),
      borderSide: const BorderSide(
        width: ZAppSize.s1,
        color: ZAppColor.alert500,
      ),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ZAppSize.s5),
      borderSide: const BorderSide(
        width: ZAppSize.s1,
        color: ZAppColor.warning500,
      ),
    ),
  );
}
