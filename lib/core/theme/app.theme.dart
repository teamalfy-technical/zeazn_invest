import 'package:flutter/material.dart';
import 'package:zeazn_invest_app/core/theme/theme.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';

class ZAppTheme {
  ZAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Epilogue',
    brightness: Brightness.light,
    primaryColor: ZAppColor.primary,
    scaffoldBackgroundColor: ZAppColor.blackColor,
    appBarTheme: ZAppBarTheme.lightAppBarTheme,
    textTheme: ZTextTheme.lightTextTheme,
    elevatedButtonTheme: ZElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: ZOutlinedButtonTheme.lightOutlinedButtonTheme,
    checkboxTheme: ZCheckboxTheme.lightCheckboxThemeData,
    chipTheme: ZChipTheme.lightChipThemeData,
    sliderTheme: ZSliderTheme.lightSliderTheme,
    bottomSheetTheme: ZBottomSheetTheme.lightBottomSheetThemeData,
    inputDecorationTheme: ZTextFormFieldTheme.lightInputDecorationTheme,
    iconTheme: ZIconTheme.lightIconThemeData,
    radioTheme: ZRadioTheme.lightRadioThemeData,
    textSelectionTheme: TextSelectionThemeData(cursorColor: ZAppColor.primary),
    navigationBarTheme: ZNavigationBarTheme.lightNavigationBarThemeData,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Epilogue',
    brightness: Brightness.dark,
    primaryColor: ZAppColor.primary,
    scaffoldBackgroundColor: ZAppColor.blackColor,
    appBarTheme: ZAppBarTheme.darkAppBarTheme,
    textTheme: ZTextTheme.darkTextTheme,
    elevatedButtonTheme: ZElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: ZOutlinedButtonTheme.darkOutlinedButtonTheme,
    checkboxTheme: ZCheckboxTheme.darkCheckboxThemeData,
    chipTheme: ZChipTheme.darkChipThemeData,
    sliderTheme: ZSliderTheme.darkSliderTheme,
    bottomSheetTheme: ZBottomSheetTheme.darkBottomSheetThemeData,
    inputDecorationTheme: ZTextFormFieldTheme.darkInputDecorationTheme,
    iconTheme: ZIconTheme.darkIconThemeData,
    navigationBarTheme: ZNavigationBarTheme.darkNavigationBarThemeData,
    radioTheme: ZRadioTheme.darkRadioThemeData,
    textSelectionTheme: TextSelectionThemeData(cursorColor: ZAppColor.primary),
  );
}
