import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';

class PCustomFilledTextfield extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  const PCustomFilledTextfield({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        ZAppSize.s4.verticalSpace,
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,

            contentPadding: EdgeInsets.symmetric(
              horizontal: ZAppSize.s20,
              vertical: 4,
            ),
            isDense: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(ZAppSize.s5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(ZAppSize.s5),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(ZAppSize.s5),
            ),
            fillColor: ZAppColor.fillColor2,
            filled: true,
          ),
        ),
      ],
    );
  }
}
