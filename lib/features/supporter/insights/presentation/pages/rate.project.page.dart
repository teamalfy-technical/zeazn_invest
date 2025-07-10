import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/creator/explore/explore.dart';
import 'package:zeazn_invest_app/features/creator/insights/insights.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';
import 'package:zeazn_invest_app/shared/shared.dart';

class ZRateProjectPage extends StatelessWidget {
  final Project project;
  ZRateProjectPage({super.key, required this.project});

  final ctrl = Get.put(ZInsightsVM());

  @override
  Widget build(BuildContext context) {
    return ZZeaznScaffold(
      backgroundColor: ZAppColor.offWhiteColor,
      logoPath: Assets.icons.logoDark.svg(height: ZAppSize.s55),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ZAppSize.s8.verticalSpace,
          Icon(
            Icons.arrow_back_ios,
            color: ZAppColor.blackColor,
          ).onPressed(onTap: () => ZHelperFunction.pop()),
          //
          ZAppSize.s12.verticalSpace,

          Align(
            alignment: Alignment.center,
            child: Text(
              'rate_this_project'.tr,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: ZAppSize.s24,
                color: ZAppColor.blackColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          ZAppSize.s16.verticalSpace,

          Container(
            padding: EdgeInsets.all(ZAppSize.s32),
            width: ZDeviceUtil.getDeviceWidth(context),
            decoration: BoxDecoration(
              color: ZAppColor.whiteColor,
              borderRadius: BorderRadius.circular(ZAppSize.s8),
            ),
            child: Column(
              children: [
                // ZAppSize.s14.verticalSpace,
                Image.asset(
                  Assets.images.ratingImg.path,
                  width: ZDeviceUtil.getDeviceWidth(context),
                  fit: BoxFit.cover,
                ),
                ZAppSize.s24.verticalSpace,
                Text(
                  'rate_your_experience'.tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: ZAppSize.s20,
                    color: ZAppColor.blackColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                ZAppSize.s8.verticalSpace,
                RatingBar.builder(
                  initialRating: project.overallRating ?? 0,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 32,
                  // itemPadding: EdgeInsets.zero,
                  itemBuilder: (context, _) =>
                      Icon(Icons.star, color: ZAppColor.primary),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),

                ZAppSize.s28.verticalSpace,
                Align(
                  alignment: Alignment.bottomRight,
                  child: // supporter toggle
                  KCustomToggleButton(
                    width: ZDeviceUtil.getDeviceWidth(context) * 0.25,
                    label: 'rate'.tr,
                    value: '',
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
