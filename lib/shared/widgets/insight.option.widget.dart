import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';

class ZInsightOptionWidget extends StatelessWidget {
  final String label;
  final String image;
  final Function()? onTap;
  const ZInsightOptionWidget({
    super.key,
    required this.label,
    required this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ZAppSize.s12),
      decoration: BoxDecoration(
        color: ZAppColor.blackColor,
        borderRadius: BorderRadius.circular(ZAppSize.s12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // CircleAvatar(
          //   radius: ZAppSize.s25,
          //   backgroundImage: AssetImage(Assets.images.slideTwo.path),
          // ),
          ClipRRect(
            borderRadius: BorderRadius.circular(ZAppSize.s10),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              width: ZAppSize.s60,
              height: ZAppSize.s50,
            ),
          ),
          ZAppSize.s0_5.horizontalSpace,
          Expanded(
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          ZAppSize.s5.horizontalSpace,
          Assets.icons.arrowRightIcon.svg(color: ZAppColor.whiteColor),
        ],
      ),
    ).onPressed(onTap: onTap);
  }
}
