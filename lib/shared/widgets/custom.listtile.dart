import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';

class PCustomListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  const PCustomListTile({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        ZAppSize.s12.verticalSpace,
        Text(subtitle, style: Theme.of(context).textTheme.bodyMedium),
      ],
    ).symmetric(horizontal: ZAppSize.s20, vertical: ZAppSize.s0);
  }
}
