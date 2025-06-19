import 'package:flutter/material.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';

class ZNavigationBarTheme {
  ZNavigationBarTheme._();

  static NavigationBarThemeData lightNavigationBarThemeData =
      NavigationBarThemeData(
        height: ZAppSize.s80,
        indicatorShape: CircleBorder(),
        indicatorColor: ZAppColor.primary,
        backgroundColor: ZAppColor.whiteColor,
        labelTextStyle: WidgetStateProperty.all(
          TextStyle(
            fontWeight: FontWeight.w600,
            color: ZAppColor.blackColor,
            fontSize: ZAppSize.s10,
          ),
        ),
      );

  static NavigationBarThemeData darkNavigationBarThemeData =
      NavigationBarThemeData(
        height: ZAppSize.s80,
        indicatorShape: CircleBorder(),
        indicatorColor: ZAppColor.primary,
        backgroundColor: ZAppColor.blackColor,
        labelTextStyle: WidgetStateProperty.all(
          TextStyle(
            fontWeight: FontWeight.w600,
            color: ZAppColor.whiteColor,
            fontSize: ZAppSize.s10,
          ),
        ),
      );
}
