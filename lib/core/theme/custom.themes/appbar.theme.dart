import 'package:flutter/material.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';

class ZAppBarTheme {
  ZAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    elevation: ZAppSize.s0,
    centerTitle: true,
    scrolledUnderElevation: ZAppSize.s0,
    backgroundColor: ZAppColor.transparentColor,
    surfaceTintColor: ZAppColor.transparentColor,
    // systemOverlayStyle: SystemUiOverlayStyle.dark,
    // systemOverlayStyle: SystemUiOverlayStyle(
    //   statusBarBrightness: Brightness.dark,
    //   statusBarIconBrightness: Brightness.dark,
    //   statusBarColor: PAppColor.transparentColor,
    //   systemNavigationBarColor: PAppColor.whiteColor,
    //   systemNavigationBarIconBrightness: Brightness.light,
    //   systemNavigationBarDividerColor: PAppColor.transparentColor,
    // ),
    iconTheme: IconThemeData(color: ZAppColor.blackColor, size: ZAppSize.s24),
    actionsIconTheme: IconThemeData(
      color: ZAppColor.textColorLight,
      size: ZAppSize.s24,
    ),
    titleTextStyle: TextStyle(
      fontSize: ZAppSize.s17,
      fontWeight: FontWeight.w600,
      color: ZAppColor.textColorLight,
    ),
  );

  static const darkAppBarTheme = AppBarTheme(
    elevation: ZAppSize.s0,
    centerTitle: true,
    scrolledUnderElevation: ZAppSize.s0,
    backgroundColor: ZAppColor.transparentColor,
    surfaceTintColor: ZAppColor.transparentColor,
    // systemOverlayStyle: SystemUiOverlayStyle.light,
    iconTheme: IconThemeData(color: ZAppColor.blackColor, size: ZAppSize.s24),
    actionsIconTheme: IconThemeData(
      color: ZAppColor.whiteColor,
      size: ZAppSize.s24,
    ),
    titleTextStyle: TextStyle(
      fontSize: ZAppSize.s17,
      fontWeight: FontWeight.w600,
      color: ZAppColor.whiteColor,
    ),
  );
}
