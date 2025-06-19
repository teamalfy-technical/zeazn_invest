import 'package:flutter/material.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';

class ZPageTagWidget extends StatelessWidget {
  final String tag;
  final double width;
  final FontWeight? fontWeight;
  final double fontSize;
  final double borderRadius;
  final bool isCentered;
  const ZPageTagWidget({
    super.key,
    required this.tag,
    required this.width,
    this.fontWeight,
    this.fontSize = ZAppSize.s13,
    this.borderRadius = ZAppSize.s4,
    this.isCentered = true,
  });

  @override
  Widget build(BuildContext context) {
    return isCentered
        ? Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(ZAppSize.s8),
          width: width,
          decoration: BoxDecoration(
            color: ZAppColor.blackColor,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Text(
            tag,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
          ),
        ).centered()
        : Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(ZAppSize.s8),
          width: width,
          decoration: BoxDecoration(
            color: ZAppColor.blackColor,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Text(
            tag,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
          ),
        );
  }
}
