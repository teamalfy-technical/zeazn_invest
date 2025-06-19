import 'package:flutter/material.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';

class ZCustomMiniButton extends StatelessWidget {
  final String text;
  final double? width;
  final double? height;
  final double borderRadius;
  final double fontSize;
  final Color? textColor;
  final Color? backgroundColor;
  final Function()? onTap;
  const ZCustomMiniButton({
    super.key,
    required this.text,
    this.width,
    this.height,
    this.borderRadius = ZAppSize.s10,
    this.backgroundColor = ZAppColor.blackColor,
    this.fontSize = ZAppSize.s10,
    this.textColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.symmetric(
        vertical: ZAppSize.s10,
        horizontal: ZAppSize.s32,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          fontSize: fontSize,
          // fontWeight: FontWeight.w400,
        ),
      ),
    ).onPressed(onTap: onTap);
  }
}
