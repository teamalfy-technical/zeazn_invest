import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';

class ZCustomButtonLeft extends StatelessWidget {
  final String label;
  final Color? borderCOlor;
  final Color? backgroundColor;
  final Color? textColor;
  final Function()? onTap;
  const ZCustomButtonLeft({
    super.key,
    required this.label,
    this.onTap,
    this.borderCOlor,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Assets.icons.arrowRectLeftIcon.svg(height: ZAppSize.s36),
        ZAppSize.s8.horizontalSpace,
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: ZAppSize.s25,
            vertical: ZAppSize.s10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(ZAppSize.s16),
              bottomRight: Radius.circular(ZAppSize.s16),
            ),
            border: Border.all(
              width: ZAppSize.s1,
              color: borderCOlor ?? ZAppColor.whiteColor,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: textColor ?? ZAppColor.whiteColor,
                  fontWeight: FontWeight.w400,
                  fontSize: ZAppSize.s17,
                ),
              ),
            ],
          ),
        ),
      ],
    ).onPressed(onTap: onTap, color: ZAppColor.primary);
  }
}
