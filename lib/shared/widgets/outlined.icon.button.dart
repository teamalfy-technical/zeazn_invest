import 'package:flutter/material.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';

class ZOutlinedIconButton extends StatelessWidget {
  final IconAlignment iconAlignment;
  final Widget icon;
  final String label;
  final Color borderColor;
  final Color backgroundColor;
  final Function()? onTap;

  const ZOutlinedIconButton({
    super.key,
    required this.icon,
    required this.label,
    this.borderColor = ZAppColor.whiteColor,
    this.backgroundColor = ZAppColor.blackColor,
    this.onTap,
    this.iconAlignment = IconAlignment.end,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onTap,
      label: Text(
        label,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: ZAppSize.s12,
        ),
      ),
      iconAlignment: IconAlignment.end,
      icon: icon,
      style: OutlinedButton.styleFrom(
        backgroundColor: backgroundColor,
        side: BorderSide(width: ZAppSize.s1, color: borderColor),
        padding: EdgeInsets.symmetric(horizontal: ZAppSize.s8),
      ),
    );
  }
}
