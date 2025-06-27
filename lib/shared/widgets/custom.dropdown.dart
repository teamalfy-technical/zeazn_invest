import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';

class ZCustomDropdown<T> extends StatelessWidget {
  final String label;
  final double? height;
  Color color;
  final T? value;
  final Widget? hint;
  final String hintText;
  final Color fillColor;
  final Color borderColor;
  final bool filled;
  final List<T> items;
  final Function(T?)? onChanged;

  ZCustomDropdown({
    super.key,
    this.color = ZAppColor.blackColor,
    this.height,
    this.value,
    required this.items,
    this.onChanged,
    this.hint,
    required this.hintText,
    required this.label,
    this.fillColor = ZAppColor.blackColor,
    this.borderColor = ZAppColor.primary,
    this.filled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label.isNotEmpty
            ? Text(
              label,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodySmall,
            )
            : SizedBox.shrink(),
        label.isNotEmpty
            ? ZAppSize.s4.verticalSpace
            : ZAppSize.s0.verticalSpace,
        SizedBox(
          height: height,
          child: DropdownButtonFormField<T>(
            focusColor: borderColor, //ZAppColor.fillColor2,
            dropdownColor:
                ZHelperFunction.isDarkMode(context)
                    ? ZAppColor.lightBlackColor
                    : ZAppColor.whiteColor,
            icon: Assets.icons.arrowDownIos.svg(),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle().copyWith(
                // fontSize: ZAppSize.s8,
                fontWeight: FontWeight.w400,
                color: ZAppColor.hintTextColor,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(width: ZAppSize.s1, color: borderColor),
                borderRadius: BorderRadius.circular(ZAppSize.s5),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: ZAppSize.s1, color: borderColor),
                borderRadius: BorderRadius.circular(ZAppSize.s5),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: ZAppSize.s1, color: borderColor),
                borderRadius: BorderRadius.circular(ZAppSize.s5),
              ),
              filled: filled,
              fillColor: fillColor,
              contentPadding: const EdgeInsets.symmetric(
                vertical: ZAppSize.s2,
                horizontal: ZAppSize.s10,
              ),
            ),
            // hint: hint,
            value: value,
            items:
                items
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          '$e',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    )
                    .toList(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
