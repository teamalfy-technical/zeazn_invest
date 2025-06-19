import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';

class ExclusiveDealWidget extends StatelessWidget {
  final double? width;
  final Function()? onTap;
  final EdgeInsets? padding;
  final double? fontSize;
  final double borderRadius;
  final bool isSelected;
  final Map<String, dynamic> deal;
  const ExclusiveDealWidget({
    super.key,
    this.width,
    this.onTap,
    this.padding,
    this.fontSize,
    this.borderRadius = ZAppSize.s20,
    required this.deal,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: ZAppSize.s30),
      width: width ?? ZDeviceUtil.getDeviceWidth(context) / 2.5,
      // height: 200,
      padding:
          padding ??
          EdgeInsets.symmetric(
            vertical: ZAppSize.s24,
            horizontal: ZAppSize.s18,
          ),
      decoration: BoxDecoration(
        color: isSelected ? ZAppColor.primary : ZAppColor.blackColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(deal['title'], style: Theme.of(context).textTheme.bodyLarge),
              ZAppSize.s10.verticalSpace,
              Text(
                deal['sub_title'],
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: fontSize == null ? null : fontSize ?? 0 + 4,
                ),
              ),
              ZAppSize.s14.verticalSpace,
              Text(
                deal['description'],
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: fontSize,
                ),
              ),
              // RichText(
              //   textAlign: TextAlign.center,
              //   text: TextSpan(
              //     children: [
              //       TextSpan(
              //         text: 'Support with GHS\n',
              //         style: Theme.of(context).textTheme.bodySmall?.copyWith(
              //           fontWeight: FontWeight.w400,
              //           fontSize: fontSize,
              //         ),
              //       ),
              //       TextSpan(
              //         text: '6,000 ',
              //         style: Theme.of(context).textTheme.bodySmall?.copyWith(
              //           fontWeight: FontWeight.w600,
              //           color: ZAppColor.primary,
              //           fontSize: fontSize,
              //         ),
              //       ),
              //       TextSpan(
              //         text: 'and receive \nan iPhone 12 \nProMax',
              //         style: Theme.of(context).textTheme.bodySmall?.copyWith(
              //           fontWeight: FontWeight.w400,
              //           fontSize: fontSize,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ).scrollable(),
    ).onPressed(onTap: onTap);
  }
}
