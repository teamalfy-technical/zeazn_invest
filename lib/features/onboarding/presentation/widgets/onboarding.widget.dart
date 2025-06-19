import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';

class ZOnboardingWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final Widget subtitle;
  final int pageIndex;
  const ZOnboardingWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.pageIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: ZDeviceUtil.getDeviceWidth(context),
          height: ZDeviceUtil.getDeviceHeight(context) / 2,
          padding: EdgeInsets.only(top: ZAppSize.s80),
          decoration: BoxDecoration(color: ZAppColor.secondary),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: ZAppSize.s31,
                  color: ZAppColor.whiteColor,
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              ZAppSize.s40.verticalSpace,
              subtitle.symmetric(horizontal: ZAppSize.s20).centered(),
            ],
          ),
        ),

        Expanded(
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: ZDeviceUtil.getDeviceWidth(context),
            height: ZDeviceUtil.getDeviceHeight(context) / 2,
          ),
        ),
      ],
    );
  }
}
