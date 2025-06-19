import 'package:flutter/material.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';

class ZCustomContainer extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  const ZCustomContainer({
    super.key,
    required this.child,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.symmetric(
        vertical: ZAppSize.s10,
        horizontal: ZAppSize.s10,
      ),
      decoration: BoxDecoration(
        color: ZAppColor.blackColor,
        borderRadius: BorderRadius.circular(ZAppSize.s5),
        border: Border.all(width: ZAppSize.s1, color: ZAppColor.primary),
      ),
      child: child,
    );
  }
}
