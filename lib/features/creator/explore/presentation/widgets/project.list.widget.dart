import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/creator/explore/explore.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';
import 'package:zeazn_invest_app/shared/shared.dart';

class ZProjectListWidget extends StatelessWidget {
  final Projects project;
  // final ZExploreVM ctrl;
  final dynamic ctrl;
  final Function()? onTap;
  const ZProjectListWidget({
    super.key,
    required this.project,
    required this.ctrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: ZDeviceUtil.getDeviceHeight(context) * 0.18,
          margin: EdgeInsets.only(bottom: ZAppSize.s18),
          padding: EdgeInsets.all(ZAppSize.s16),
          decoration: BoxDecoration(
            color: ZAppColor.blackColor,
            borderRadius: BorderRadius.circular(ZAppSize.s10),
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(ZAppSize.s6),
                    child: Image.network(
                      project.image ?? '',
                      fit: BoxFit.cover,
                      height: ZDeviceUtil.getDeviceHeight(context) * 0.09,
                      width: ZDeviceUtil.getDeviceWidth(context) * 0.32,
                    ),
                  ),
                  ZAppSize.s8.verticalSpace,
                  // creator info
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: ZAppSize.s16,
                        backgroundImage: NetworkImage(
                          project.creator?.image ?? '',
                        ),
                      ),
                      ZAppSize.s8.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'By ${project.creator?.firstName} ${project.creator?.lastName}',
                            style: Theme.of(
                              context,
                            ).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: ZAppColor.hintTextColor,
                              fontSize: ZAppSize.s10,
                            ),
                          ),
                          RatingBar.builder(
                            initialRating: project.creator?.ratings ?? 0,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 16,
                            // itemPadding: EdgeInsets.zero,
                            itemBuilder:
                                (context, _) =>
                                    Icon(Icons.star, color: ZAppColor.primary),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              ZAppSize.s16.horizontalSpace,

              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            project.title ?? '',
                            style: Theme.of(
                              context,
                            ).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: ZAppColor.whiteColor,
                              fontSize: ZAppSize.s10,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'share'.tr,
                              style: Theme.of(
                                context,
                              ).textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.w400,
                                color: ZAppColor.primary,
                                fontSize: ZAppSize.s10,
                              ),
                            ),
                            ZAppSize.s6.horizontalSpace,
                            Assets.icons.shareIcon.svg(),
                          ],
                        ).onPressed(
                          onTap: () {
                            // share project
                          },
                        ),
                      ],
                    ),
                    ZAppSize.s8.verticalSpace,
                    Text(
                      project.description ?? '',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: ZAppSize.s10,
                      ),
                    ).scrollable(),

                    // ZAppSize.s8.verticalSpace,
                    Spacer(),

                    // share
                    // ZAppSize.s8.verticalSpace,
                    Align(
                      alignment: Alignment.bottomRight,
                      child: RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          text: '${'target'.tr} ',
                          style: Theme.of(
                            context,
                          ).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: ZAppSize.s10,
                          ),
                          children: [
                            TextSpan(
                              text: ZFormatter.formatCurrency(
                                amount: project.targetAmount ?? 0,
                              ),
                              style: Theme.of(
                                context,
                              ).textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: ZAppSize.s10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // slider
        Stack(
          alignment: Alignment.center,
          children: [
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                tickMarkShape: VerticalTickMarkShape(),
                thumbShape: BorderedThumbShape(),
                activeTrackColor: ZAppColor.text300,
                inactiveTrackColor: ZAppColor.text700,
              ),
              child: Slider(
                min: ctrl.min,
                max: project.targetAmount ?? 0,
                value: ctrl.sliderValue.value + 9000,
                divisions: ZAppSize.s10.toInt(),
                label: ZFormatter.formatCurrency(
                  amount: ctrl.sliderValue.value,
                ),
                onChanged: ctrl.onSliderChanged,
              ),
            ),
            Positioned(
              left: ZDeviceUtil.getDeviceWidth(context) * 0.1,
              child: Text(
                ZFormatter.formatCurrency(amount: 1000),
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(fontSize: ZAppSize.s8),
              ),
            ),
            Positioned(
              right: ZDeviceUtil.getDeviceWidth(context) * 0.1,
              child: Text(
                ZFormatter.formatCurrency(amount: 20000),
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(fontSize: ZAppSize.s8),
              ),
            ),
            Positioned(
              right: ZDeviceUtil.getDeviceWidth(context) * 0.1,
              bottom: 0,
              child: Text(
                'target'.tr,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: ZAppSize.s8,
                  color: ZAppColor.text500,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Positioned(
              right: 0,
              left: 0,
              bottom: 0,
              child:
                  Text(
                    'amt_raised'.tr,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: ZAppSize.s8,
                      color: ZAppColor.text500,
                      fontWeight: FontWeight.w300,
                    ),
                  ).centered(),
            ),
            Align(
              alignment: Alignment.center,
              // left: 0,
              // right: 0,
              child: Text(
                ZFormatter.formatCurrency(amount: 10000),
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(fontSize: ZAppSize.s8),
              ),
            ),
          ],
        ),
        ZAppSize.s10.verticalSpace,
      ],
    ).onPressed(onTap: onTap);
  }
}
