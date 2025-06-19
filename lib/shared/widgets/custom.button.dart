import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';

class ZCustomButton extends StatelessWidget {
  final String label;
  final Function()? onTap;
  final SvgPicture? icon;
  final double? radius;
  final double fontSize;
  const ZCustomButton({
    super.key,
    required this.label,
    this.onTap,
    this.icon,
    this.radius,
    this.fontSize = ZAppSize.s20,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ZAppSize.s14,
        vertical: ZAppSize.s12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? ZAppSize.s16),
        color: ZAppColor.primary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: ZAppColor.whiteColor,
                fontWeight: FontWeight.w600,
                fontSize: fontSize,
              ),
            ),
          ),
          ZAppSize.s20.horizontalSpace,
          icon ?? Assets.icons.arrowRectRightIcon.svg(height: ZAppSize.s32),
        ],
      ),
    ).onPressed(onTap: onTap);
  }
}
