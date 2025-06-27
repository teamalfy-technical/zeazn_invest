import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';

class ZCustomButtonRight extends StatelessWidget {
  final String label;
  final Color? borderColor;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final Function()? onTap;
  const ZCustomButtonRight({
    super.key,
    required this.label,
    this.onTap,
    this.borderColor,
    this.backgroundColor,
    this.textColor,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? ZDeviceUtil.getDeviceWidth(context) * 0.45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: ZAppSize.s25,
                vertical: ZAppSize.s10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(ZAppSize.s16),
                  bottomLeft: Radius.circular(ZAppSize.s16),
                ),
                border: Border.all(
                  width: ZAppSize.s1,
                  color: borderColor ?? ZAppColor.whiteColor,
                ),
                color: backgroundColor,
              ),
              child: Text(
                label,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: textColor ?? ZAppColor.whiteColor,
                  fontWeight: FontWeight.w400,
                  fontSize: ZAppSize.s17,
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: [
              //     Expanded(
              //       child: Text(
              //         label,
              //         style: Theme.of(context).textTheme.titleSmall?.copyWith(
              //           color: textColor ?? ZAppColor.whiteColor,
              //           fontWeight: FontWeight.w400,
              //           fontSize: ZAppSize.s17,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ),
          ),
          ZAppSize.s8.horizontalSpace,
          Assets.icons.arrowRectRightIcon.svg(height: ZAppSize.s36),
        ],
      ).onPressed(onTap: onTap, color: ZAppColor.primary),
    );
  }
}
