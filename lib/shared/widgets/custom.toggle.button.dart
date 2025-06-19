import 'package:flutter/material.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';

class KCustomToggleButton extends StatelessWidget {
  final String label;
  final String? value;
  final double? width;
  final Function()? onTap;
  const KCustomToggleButton({
    super.key,
    required this.label,
    this.value,
    this.onTap,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.all(ZAppSize.s5),
      decoration: BoxDecoration(
        color: ZAppColor.primary,
        borderRadius: BorderRadius.circular(ZAppSize.s12),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: ZAppSize.s8,
              horizontal: ZAppSize.s16,
            ),

            decoration: BoxDecoration(
              color: ZAppColor.blackColor,
              borderRadius: BorderRadius.circular(ZAppSize.s8),
            ),
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: ZAppSize.s10,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          Assets.icons.arrowRightTriple.svg(),
          // 3 arrow icons
          Text(
            value ?? '',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: ZAppSize.s10,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    ).onPressed(onTap: onTap);
  }
}
