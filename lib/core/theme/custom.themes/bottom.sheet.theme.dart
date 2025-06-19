import 'package:flutter/material.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';

class ZBottomSheetTheme {
  ZBottomSheetTheme._();

  static BottomSheetThemeData lightBottomSheetThemeData = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: ZAppColor.whiteColor,
    modalBackgroundColor: ZAppColor.whiteColor,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(ZAppSize.s16),
    ),
  );

  static BottomSheetThemeData darkBottomSheetThemeData = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: ZAppColor.blackColor,
    modalBackgroundColor: ZAppColor.blackColor,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(ZAppSize.s16),
    ),
  );
}
