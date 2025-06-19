import 'package:flutter/material.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';

/// -- Light & Dark Chip Themes
class ZIconTheme {
  ZIconTheme._();

  /// -- Light Theme
  static IconThemeData lightIconThemeData = IconThemeData(
    color: ZAppColor.blackColor,
  );

  /// -- Dark Theme
  static IconThemeData darkIconThemeData = const IconThemeData(
    color: ZAppColor.whiteColor,
  );
}
