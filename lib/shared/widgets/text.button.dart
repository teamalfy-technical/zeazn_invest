import 'package:flutter/material.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';

class PTextButton extends StatelessWidget {
  final String label;
  final Color foregroundColor;
  final Function()? onPressed;
  const PTextButton({
    super.key,
    required this.label,
    this.foregroundColor = ZAppColor.whiteColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      label: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
      iconAlignment: IconAlignment.end,
      icon: Assets.icons.arrowIcon.svg(color: foregroundColor),
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        foregroundColor: foregroundColor,
      ),
    );
  }
}
