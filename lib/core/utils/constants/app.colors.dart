import 'package:flutter/material.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';

class ZAppColor {
  ZAppColor._();

  // App Basic Colors
  static const Color primaryDark = Color(0xFFFC7203);
  static const Color primary = Color(0xFFF6852A);
  static const Color secondary = Color(0xFF302F2F);

  static const Color greyColorShade300 = Color(0xFFE0E0E0);
  static const Color greyColorShade100 = Color(0xFFf5f5f5);
  static const Color fillColor2 = Color(0xADF1F1F1);
  static const Color fillColor = Color(0xFFE9E9E9);
  static const Color pinkColor = Color(0xFFfc4b6c);

  // for dark theme colors
  static const Color blackColor = Color(0xFF1E1E1E);
  static const Color blackColorDark = Color(0xFF131313);
  static const Color darkColor = Color(0xFF302F2F);

  static const Color lightBlackColor = Color(0xFF1f1f1f);

  static const Color shadowColor = Color(0xFF151313);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color offWhiteColor = Color(0xFFD8E6EC);

  static const Color greyColor = Colors.grey;

  static const Color blackColor12 = Colors.black12;
  static const Color darkFillColor = Color(0xFF302F2F);

  static const Color transparentColor = Colors.transparent;
  static const Color errorColor = Color(0xFFfa4b69);
  static const Color focusedErrorColor = Color(0xFFE4A11B);
  static const Color whiteTextColor = Color(0xFFD8E6EC);

  // bars color
  static const Color voiletLight = Color(0xF08061DB);
  static const Color voiletDark = Color(0x618061DB);

  // Background Colors
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);
  static const Color primaryBackground = Color(0xFFF3F5FF);

  // Background Container Colors
  static const Color lightContainer = Color(0xFFF6F6F6);
  static Color darkContainer = ZAppColor.whiteColor.withOpacityExt(
    ZAppSize.s0_1,
  );

  // Button Colors
  static const Color buttonPrimary = ZAppColor.primary;
  static const Color buttonSecondary = Color(0xFF6C757D);
  static const Color buttonDisabled = Color(0xFFC4C4C4);

  // Border Colors
  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFE6E6E6);
  static const Color darkGrey = Color(0xFF1F1F1F);

  // Text Colors
  static const Color primaryTextColor = Color(0xFF245920);
  static const Color text50 = Color(0xFFD8E6EC);
  static const Color text100 = Color(0xFFC0BEBE);
  static const Color text200 = Color(0xFF989898);
  static const Color text300 = Color(0xFF767272);
  static const Color text500 = Color(0xFF585757);
  static const Color text700 = Color(0xFF151313);
  static const Color hintTextColor = Color(0xFF989898);
  static const Color dividerColor = Color(0xFFD4D4D4);

  static const Color textColorLight = Color(0xFF1E1E1E);
  static const Color textColorDark = Color(0xFF151515);

  // Alert Colors
  static const Color alert50 = Color(0xFFFCEDF0);
  static const Color alert100 = Color(0xFFE88797);
  static const Color alert300 = Color(0xFFdc4c64);
  static const Color alert500 = Color(0xFFc8455b);
  static const Color alert700 = Color(0xFF9c3647);

  static const Color redColor = Color(0xFFFF0000);

  // Warning Colors
  static const Color warning50 = Color(0xFFfcf6e8);
  static const Color warning100 = Color(0xFFf3d496);
  static const Color warning300 = Color(0xFFedc066);
  static const Color warning500 = Color(0xFFe4a11b);
  static const Color warning700 = Color(0xFFa27213);

  // Success Colors
  static const Color success50 = Color(0xFFe8f6ed);
  static const Color success100 = Color(0xFF93d5ad);
  static const Color success300 = Color(0xFF62c288);
  static const Color success500 = Color(0xFF14a44d);
  static const Color success700 = Color(0xFF0e7437);

  // Info Colors
  static const Color info50 = Color(0xFFefeafc);
  static const Color info100 = Color(0xFFb49df2);
  static const Color info300 = Color(0xFF9271ec);
  static const Color info500 = Color(0xFF5c2be2);
  static const Color info700 = Color(0xFF411fa0);
}

final gradient = LinearGradient(
  begin: Alignment.bottomCenter,
  end: Alignment.topCenter,
  colors: [ZAppColor.voiletLight, ZAppColor.voiletDark],
);

final borderRadius = BorderRadius.only(
  topLeft: Radius.circular(ZAppSize.s6),
  topRight: Radius.circular(ZAppSize.s6),
);
