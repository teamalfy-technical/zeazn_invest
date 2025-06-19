import 'package:flutter/material.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';

class ZCustomOutlinedButton extends StatelessWidget {
  final Function()? onTap;

  final Widget child;
  final EdgeInsets? padding;
  final Color backgroundColor;
  final Color borderColor;
  const ZCustomOutlinedButton({
    super.key,
    this.onTap,
    required this.child,
    this.padding,
    this.backgroundColor = ZAppColor.blackColor,
    this.borderColor = ZAppColor.primary,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        backgroundColor: backgroundColor,
        side: BorderSide(color: borderColor),
        padding:
            padding ??
            EdgeInsets.symmetric(
              horizontal: ZAppSize.s10,
              vertical: ZAppSize.s10,
            ),
      ),
      child: child,
    );
  }
}
