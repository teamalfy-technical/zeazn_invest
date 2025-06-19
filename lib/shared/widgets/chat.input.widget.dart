import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';

class ChatInputWidget extends StatelessWidget {
  final String? hintText;
  final TextEditingController controller;
  final Function()? onSendTap;
  const ChatInputWidget({
    super.key,
    this.hintText,
    this.onSendTap,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              fillColor: ZAppColor.whiteColor,
              filled: true,
              hintText: hintText ?? 'type_message'.tr,
              hintStyle: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: ZAppColor.text100),
              contentPadding: EdgeInsets.symmetric(
                horizontal: ZAppSize.s16,
                vertical: ZAppSize.s12,
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  // show emoji widget
                },
                icon: Assets.icons.emojiIcon.svg(),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: ZAppSize.s1,
                  color: ZAppColor.whiteColor,
                ),
                borderRadius: BorderRadius.circular(ZAppSize.s12),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: ZAppSize.s1,
                  color: ZAppColor.whiteColor,
                ),
                borderRadius: BorderRadius.circular(ZAppSize.s12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: ZAppSize.s1,
                  color: ZAppColor.whiteColor,
                ),
                borderRadius: BorderRadius.circular(ZAppSize.s12),
              ),
            ),
          ),
        ),
        ZAppSize.s14.horizontalSpace,
        FloatingActionButton(
          onPressed: onSendTap,
          shape: CircleBorder(),
          backgroundColor: ZAppColor.primary,
          child: Assets.icons.microphoneIcon.svg(),
        ),
      ],
    );
  }
}
