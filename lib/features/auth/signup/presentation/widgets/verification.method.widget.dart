import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';

class ZVerificationMethodWidget extends StatelessWidget {
  final String label;
  final int index;
  final bool isSelected;
  String? title;
  final Function()? onTap;
  ZVerificationMethodWidget({
    super.key,
    required this.label,
    required this.index,
    required this.isSelected,
    this.onTap,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    title = title ?? 'verification'.tr.toUpperCase();
    return Container(
      margin: EdgeInsets.only(bottom: ZAppSize.s16),
      padding: EdgeInsets.all(ZAppSize.s10),
      decoration: BoxDecoration(
        color: isSelected ? ZAppColor.primary : null,
        borderRadius: BorderRadius.circular(ZAppSize.s10),
        border: Border.all(
          width: 1,
          color: isSelected ? ZAppColor.whiteColor : ZAppColor.primary,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$title ${index == 0
                    ? 'A'
                    : index == 1
                    ? 'B'
                    : 'C'}',
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: isSelected ? ZAppColor.whiteColor : ZAppColor.primary,
                  fontSize: ZAppSize.s14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              ZAppSize.s32.verticalSpace,
              Container(
                padding: EdgeInsets.all(ZAppSize.s8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 4,
                    color:
                        isSelected ? ZAppColor.whiteColor : ZAppColor.primary,
                  ),
                ),
              ),
              // Checkbox.adaptive(value: false, onChanged: (value) {}),
            ],
          ),

          Text(
            label,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: isSelected ? ZAppColor.blackColor : ZAppColor.whiteColor,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    ).onPressed(onTap: onTap);
  }
}
