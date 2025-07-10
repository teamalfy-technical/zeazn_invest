import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/creator/explore/explore.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';
import 'package:zeazn_invest_app/shared/shared.dart';

class ZMyCampaignWidget extends StatelessWidget {
  final Project project;
  // final ZExploreVM ctrl;
  final dynamic ctrl;
  final Function()? onTap;
  final Function()? onChatTap;
  const ZMyCampaignWidget({
    super.key,
    required this.project,
    required this.ctrl,
    this.onTap,
    this.onChatTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: ZDeviceUtil.getDeviceHeight(context) * 0.50,
      margin: EdgeInsets.only(bottom: ZAppSize.s18),
      padding: EdgeInsets.all(ZAppSize.s16),
      decoration: BoxDecoration(
        color: ZAppColor.blackColor,
        borderRadius: BorderRadius.circular(ZAppSize.s10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(ZAppSize.s6),
                    child: Image.network(
                      project.creator?.url ?? 'https://picsum.photos/200',
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
                          project.creator?.url ?? 'https://picsum.photos/200',
                        ),
                      ),
                      ZAppSize.s8.horizontalSpace,

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'By ${project.creator?.name}',
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: ZAppColor.hintTextColor,
                                  fontSize: ZAppSize.s10,
                                ),
                          ),
                          RatingBar.builder(
                            initialRating: project.overallRating ?? 0,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 16,
                            // itemPadding: EdgeInsets.zero,
                            itemBuilder: (context, _) =>
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
              ZAppSize.s8.verticalSpace,
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  text: '${'support'.tr}:',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: ZAppSize.s12,
                  ),
                  children: [
                    TextSpan(
                      text: '\$33,555.67',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: ZAppSize.s12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          ZAppSize.s16.horizontalSpace,

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        '',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          // color: ZAppColor.hintTextColor,
                          fontSize: ZAppSize.s10,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'share'.tr,
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                fontWeight: FontWeight.w400,
                                color: ZAppColor.primary,
                                fontSize: ZAppSize.s13,
                              ),
                        ),
                        ZAppSize.s6.horizontalSpace,
                        Assets.icons.shareIcon.svg(height: ZAppSize.s20),
                      ],
                    ).onPressed(
                      onTap: () {
                        // share project
                      },
                    ),
                  ],
                ),
                ZAppSize.s8.verticalSpace,
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: '${project.creator?.name}: ',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: ZAppSize.s12,
                    ),
                    children: [
                      TextSpan(
                        text: project.desc,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: ZAppSize.s12,
                        ),
                      ),
                    ],
                  ),
                ),
                ZAppSize.s8.verticalSpace,
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: '${'country'.tr}:',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: ZAppSize.s12,
                    ),
                    children: [
                      TextSpan(
                        text: project.location,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: ZAppSize.s12,
                        ),
                      ),
                    ],
                  ),
                ),

                // ZAppSize.s8.verticalSpace,
                // Spacer(),
                ZAppSize.s8.verticalSpace,
                Align(
                  alignment: Alignment.bottomRight,
                  child: // supporter toggle
                  KCustomToggleButton(
                    width: ZDeviceUtil.getDeviceWidth(context) * 0.27,
                    label: 'chat'.tr,
                    value: '',
                    onTap: onChatTap,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ).onPressed(onTap: onTap);
  }
}
