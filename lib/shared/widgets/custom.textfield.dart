import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';

class ZCustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final String? prefixIcon;
  final String? suffixIcon;
  final Color? focusColor;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final bool enabled;
  final int? minLines;
  final int? maxLines;
  final Color? fillColor;
  final Color borderColor;
  final bool filled;
  final EdgeInsetsGeometry? contentPadding;
  final String? Function(String?)? validator;

  final Function(String)? onChanged;

  const ZCustomTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.prefixIcon,
    this.focusColor,
    this.controller,
    this.enabled = true,
    this.textInputType = TextInputType.text,
    this.validator,
    this.suffixIcon,
    this.minLines,
    this.maxLines = 1,
    this.onChanged,
    this.fillColor,
    this.borderColor = ZAppColor.primary,
    this.filled = false,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText.isNotEmpty)
          Column(
            children: [
              Text(
                labelText,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: ZAppSize.s14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              ZAppSize.s3.verticalSpace,
            ],
          ),

        TextFormField(
          controller: controller,
          validator: validator,
          enabled: enabled,
          minLines: minLines,
          maxLines: maxLines,
          onChanged: onChanged,
          decoration: InputDecoration(
            fillColor: fillColor,
            filled: filled,
            contentPadding: contentPadding,
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
            focusColor: focusColor,
            prefixIcon: prefixIcon
                ?.svg(
                  color:
                      ZHelperFunction.isDarkMode(context)
                          ? ZAppColor.whiteColor
                          : ZAppColor.blackColor,
                )
                .symmetric(horizontal: ZAppSize.s16),
            suffixIcon:
                suffixIcon == null
                    ? null
                    : IconButton(
                      onPressed: () {},
                      icon: suffixIcon!.svg(color: focusColor),
                    ),
            hintText: hintText,
          ),
        ),
      ],
    );
  }
}
