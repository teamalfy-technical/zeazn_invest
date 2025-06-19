import 'package:flutter/material.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';

/// -- Light & Dark Checkbox Themes
class ZCheckboxTheme {
  ZCheckboxTheme._();

  /// -- Light Theme
  static CheckboxThemeData lightCheckboxThemeData = CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(ZAppSize.s2),
    ),
    side: BorderSide.none,
    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return ZAppColor.whiteColor;
      } else {
        return ZAppColor.blackColor;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return ZAppColor.primary;
      } else {
        return ZAppColor.fillColor2;
      }
    }),
  );

  /// -- Dark Theme
  static CheckboxThemeData darkCheckboxThemeData = CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(ZAppSize.s2),
    ),
    side: BorderSide.none,
    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return ZAppColor.whiteColor;
      } else {
        return ZAppColor.blackColor;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return ZAppColor.primary;
      } else {
        return ZAppColor.fillColor2;
      }
    }),
  );
}
