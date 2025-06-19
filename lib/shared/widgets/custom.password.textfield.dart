import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';

class ZCustomPasswordTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final String? prefixIcon;
  final String? suffixIcon;
  final Color? focusColor;
  final TextEditingController controller;
  final bool obscure;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final Function()? onObscureChanged;
  final bool isPasswordStrong;
  final void Function(String)? onChanged;
  const ZCustomPasswordTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    this.focusColor,
    required this.controller,
    this.obscure = true,
    this.textInputType = TextInputType.text,
    this.onObscureChanged,
    this.onChanged,
    this.isPasswordStrong = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        TextFormField(
          controller: controller,
          obscureText: obscure,
          validator: validator ?? ZValidator.validatePassword,
          onChanged: onChanged,
          decoration: InputDecoration(
            errorBorder: const OutlineInputBorder().copyWith(
              borderRadius: BorderRadius.circular(ZAppSize.s8),
              borderSide: BorderSide(
                width: ZAppSize.s1,
                color:
                    isPasswordStrong
                        ? ZAppColor.primary
                        : controller.text.isNotEmpty
                        ? ZAppColor.warning500
                        : ZAppColor.alert500,
              ),
            ),
            focusedErrorBorder: const OutlineInputBorder().copyWith(
              borderRadius: BorderRadius.circular(ZAppSize.s8),
              borderSide: BorderSide(
                width: ZAppSize.s1,
                color:
                    isPasswordStrong
                        ? ZAppColor.primary
                        : controller.text.isNotEmpty
                        ? ZAppColor.warning500
                        : ZAppColor.alert500,
              ),
            ),
            errorStyle: TextStyle(
              color:
                  isPasswordStrong
                      ? ZAppColor.primary
                      : controller.text.isNotEmpty
                      ? ZAppColor.warning500
                      : ZAppColor.alert500,
            ),
            focusColor: focusColor,
            prefixIcon: prefixIcon?.svg(
              color:
                  ZHelperFunction.isDarkMode(context)
                      ? ZAppColor.whiteColor
                      : ZAppColor.blackColor,
            ),
            suffixIcon:
                suffixIcon == null
                    ? null
                    : IconButton(
                      onPressed: onObscureChanged,
                      icon: suffixIcon!.svg(
                        color:
                            obscure ? ZAppColor.primary : ZAppColor.whiteColor,
                      ),
                    ),
            hintText: hintText,
          ),
        ),
      ],
    );
  }
}
