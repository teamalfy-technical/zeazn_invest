import 'package:flutter/material.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';

class ZRadioListTileWidget<T> extends StatelessWidget {
  final String label;
  final T value;
  final T? groupValue;
  final Function(T?)? onChanged;

  const ZRadioListTileWidget({
    super.key,
    required this.label,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Radio<T>(value: value, groupValue: groupValue, onChanged: onChanged),
        // ZAppSize.s4.horizontalSpace,
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w400,
            color: ZAppColor.blackColor,
            // fontSize: ZAppSize.s10,
          ),
        ),
      ],
    );
  }
}
