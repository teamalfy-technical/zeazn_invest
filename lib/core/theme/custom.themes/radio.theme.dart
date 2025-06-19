import 'package:flutter/material.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';

/// -- Light & Dark Radio Themes
class ZRadioTheme {
  ZRadioTheme._();

  /// -- Light Theme
  static RadioThemeData lightRadioThemeData = RadioThemeData(
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    splashRadius: ZAppSize.s24,
    visualDensity: VisualDensity.compact,
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return ZAppColor.primary;
      }
      return ZAppColor.text500; //
    }),
  );

  /// -- Dark Theme
  static RadioThemeData darkRadioThemeData = RadioThemeData(
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    splashRadius: ZAppSize.s24,
    visualDensity: VisualDensity.compact,
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return ZAppColor.primary;
      }
      return ZAppColor.text500; //
    }),
  );
}
