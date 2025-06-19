import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';

class ZCustomCheckbox extends StatelessWidget {
  final Widget child;
  final bool value;
  final double scale;
  final Function(bool?)? onChanged;
  final Direction checkboxDirection;
  final BorderSide? side;
  const ZCustomCheckbox({
    super.key,
    required this.child,
    required this.onChanged,
    required this.value,
    this.scale = ZAppSize.s1,
    this.checkboxDirection = Direction.left,
    this.side,
  });

  @override
  Widget build(BuildContext context) {
    return checkboxDirection == Direction.left
        ? Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Transform.scale(
              scale: scale,
              child: Checkbox(
                side: side,
                value: value,
                onChanged: onChanged,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
            ZAppSize.s4.horizontalSpace,
            Expanded(child: child),
          ],
        )
        : Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(child: child),
            ZAppSize.s4.horizontalSpace,
            Transform.scale(
              scale: scale,
              child: Checkbox(
                side: side,
                value: value,
                onChanged: onChanged,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
              ),
            ),
          ],
        );
  }
}
