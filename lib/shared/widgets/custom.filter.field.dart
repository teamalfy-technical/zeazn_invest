import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';

class ZCustomFilterField extends StatelessWidget {
  final String? hintText;
  final Function()? onSearchTap;
  final Function()? onFilterTap;
  const ZCustomFilterField({
    super.key,
    this.hintText,
    this.onSearchTap,
    this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        fillColor: ZAppColor.whiteColor,
        filled: true,
        hintText: hintText ?? 'search_here'.tr,
        hintStyle: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(color: ZAppColor.text100),
        contentPadding: EdgeInsets.zero,
        prefixIcon: IconButton(
          onPressed: onSearchTap,
          icon: Assets.icons.searchIcon.svg(height: ZAppSize.s20),
        ),
        suffixIcon: IconButton(
          onPressed: onFilterTap,
          icon: Assets.icons.filterIcon.svg(height: ZAppSize.s16),
        ),

        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(ZAppSize.s20),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(ZAppSize.s20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(ZAppSize.s20),
        ),
      ),
    );
  }
}
