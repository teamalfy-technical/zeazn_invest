import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/creator/explore/explore.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';
import 'package:zeazn_invest_app/routes/app.pages.dart';
import 'package:zeazn_invest_app/shared/shared.dart';

class ZTrendingProjectWidget extends StatelessWidget {
  final Projects project;
  final String? supportValue;
  final Function()? onTap;
  final Function()? onSupportTap;
  final Function()? onVideoProfileTap;
  final Function()? onProfileTap;
  const ZTrendingProjectWidget({
    super.key,
    required this.project,
    this.onTap,
    this.onSupportTap,
    this.supportValue,
    this.onVideoProfileTap,
    this.onProfileTap,
  });

  Widget actionButton({
    required BuildContext context,
    required Widget icon,
    required String label,
    Color borderColor = ZAppColor.whiteColor,
    required Function()? onTap,
  }) {
    return OutlinedButton.icon(
      onPressed: onTap,
      label: Text(
        label,
        style: Theme.of(
          context,
        ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400),
      ),
      iconAlignment: IconAlignment.end,
      icon: icon,
      style: OutlinedButton.styleFrom(
        side: BorderSide(width: ZAppSize.s1, color: borderColor),
        padding: EdgeInsets.symmetric(horizontal: ZAppSize.s8),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: ZAppSize.s18),
      padding: EdgeInsets.all(ZAppSize.s16),
      decoration: BoxDecoration(
        color: ZAppColor.blackColor,
        borderRadius: BorderRadius.circular(ZAppSize.s20),
      ),
      child: Column(
        children: [
          // view profile section
          Row(
            children: [
              CircleAvatar(
                radius: ZAppSize.s40,
                backgroundImage: NetworkImage(project.image ?? ''),
              ).onPressed(onTap: onProfileTap),
              ZAppSize.s14.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'view_profile_video'.tr,
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: ZAppColor.primary,
                            // fontSize: ZAppSize.s10,
                          ),
                        ).onPressed(onTap: onVideoProfileTap),
                        ZAppSize.s8.horizontalSpace,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'share'.tr,
                              style: Theme.of(
                                context,
                              ).textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.w500,
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
                    ZAppSize.s6.verticalSpace,
                    RichText(
                      textAlign: TextAlign.start,

                      text: TextSpan(
                        text:
                            '${project.creator?.firstName} ${project.creator?.lastName}: ',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: ZAppSize.s12,
                        ),
                        children: [
                          TextSpan(
                            text: project.description,
                            style: Theme.of(
                              context,
                            ).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: ZAppSize.s12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          ZAppSize.s16.verticalSpace,

          // Project rating && social media
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Project rating
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${'project_rating'.tr}:',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  ZAppSize.s4.horizontalSpace,

                  RatingBar.builder(
                    initialRating: project.creator?.ratings ?? 0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: ZAppSize.s18,
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

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${'social_media'.tr}:',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  ZAppSize.s4.horizontalSpace,
                  Row(
                    children: [
                      ZAppSize.s4.horizontalSpace,
                      Assets.icons.instagramIcon.svg(),
                      ZAppSize.s4.horizontalSpace,
                      Assets.icons.facebookIcon.svg(),
                    ],
                  ),
                ],
              ),
              // Text(
              //   '${'project_rating'.tr}:',
              //   style: Theme.of(
              //     context,
              //   ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
              // ),

              // // ZAppSize.s4.horizontalSpace,
              // RatingBar.builder(
              //   initialRating: project.creator?.ratings ?? 0,
              //   minRating: 1,
              //   direction: Axis.horizontal,
              //   allowHalfRating: true,
              //   itemCount: 5,
              //   itemSize: ZAppSize.s18,
              //   // itemPadding: EdgeInsets.zero,
              //   itemBuilder:
              //       (context, _) => Icon(Icons.star, color: ZAppColor.primary),
              //   onRatingUpdate: (rating) {
              //     print(rating);
              //   },
              // ),
              // ZAppSize.s8.horizontalSpace,
              // social media handles
              // Expanded(
              //   child: Row(
              //     children: [
              //       Expanded(
              //         child: Text(
              //           '${'social_media'.tr}:',
              //           style: Theme.of(context).textTheme.bodySmall?.copyWith(
              //             fontWeight: FontWeight.w600,
              //           ),
              //         ),
              //       ),
              //       Row(
              //         children: [
              //           ZAppSize.s4.horizontalSpace,
              //           Assets.icons.instagramIcon.svg(),
              //           ZAppSize.s4.horizontalSpace,
              //           Assets.icons.facebookIcon.svg(),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),

          // ZAppSize.s16.verticalSpace,

          // Row(
          //   children: [
          //     Expanded(
          //       child: Text(
          //         '${'social_media'.tr}:',
          //         style: Theme.of(
          //           context,
          //         ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
          //       ),
          //     ),
          //     Row(
          //       children: [
          //         ZAppSize.s4.horizontalSpace,
          //         Assets.icons.instagramIcon.svg(),
          //         ZAppSize.s4.horizontalSpace,
          //         Assets.icons.facebookIcon.svg(),
          //       ],
          //     ),
          //   ],
          // ),
          ZAppSize.s16.verticalSpace,

          // Project videos
          Row(
            children: [
              Text(
                '${'project_videos'.tr}:',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
              ),
              ZAppSize.s6.horizontalSpace,
              Expanded(
                child: SizedBox(
                  height: ZDeviceUtil.getDeviceHeight(context) * 0.09,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(ZAppSize.s12),
                        child: Image.network(
                          project.image ?? '',
                          fit: BoxFit.cover,
                          width: ZDeviceUtil.getDeviceWidth(context) * 0.21,
                        ),
                      ).only(right: ZAppSize.s20);
                    },
                  ),
                ),
              ),
            ],
          ),

          ZAppSize.s16.verticalSpace,

          //  Project description
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      '${'project_description'.tr}:',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  // country
                  Row(
                    children: [
                      Text(
                        '${'country'.tr}:',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Ghana',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              ZAppSize.s6.verticalSpace,
              Text(
                project.description ?? '',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400),
              ),
            ],
          ),

          ZAppSize.s16.verticalSpace,

          //  Project budget
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'project_budget'.tr,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  ZAppSize.s6.verticalSpace,
                  Text(
                    ZFormatter.formatCurrency(
                      amount: project.targetAmount ?? 0,
                    ),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              ZAppSize.s8.horizontalSpace,
              // supporter toggle
              KCustomToggleButton(
                label: 'support'.tr,
                value: supportValue,
                onTap: onSupportTap,
              ),

              // Assets.icons.supporterToggle.svg().onPressed(onTap: onSupportTap),
            ],
          ),

          ZAppSize.s16.verticalSpace,

          //  Amount raised
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'amount_raised'.tr,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  ZAppSize.s6.verticalSpace,
                  Text(
                    ZFormatter.formatCurrency(
                      amount: project.targetAmount ?? 0,
                    ),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              ZAppSize.s8.horizontalSpace,
              // supporter toggle
              Text(
                'view_supporters'.tr,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: ZAppColor.primary,
                ),
              ).onPressed(
                onTap:
                    () => ZHelperFunction.switchScreen(
                      destination: Routes.projectSupportersPage,
                    ),
              ),
            ],
          ),

          ZAppSize.s16.verticalSpace,

          // action buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ZOutlinedIconButton(
                icon: Assets.icons.commentIcon.svg(),
                label: 'reviews'.tr,
                onTap: () {
                  ZHelperFunction.switchScreen(
                    destination: Routes.projectReviewsPage,
                    args: project,
                  );
                },
              ),
              ZOutlinedIconButton(
                icon: Assets.icons.updateIcon.svg(),
                label: 'updates'.tr,
                onTap: () {
                  ZHelperFunction.switchScreen(
                    destination: Routes.projectUpdatesPage,
                    args: project,
                  );
                },
              ),
              ZOutlinedIconButton(
                icon: Assets.icons.faqIcon.svg(),
                label: '${'faq'.tr.toUpperCase()}\'s'.tr,
                onTap: () {
                  ZHelperFunction.switchScreen(
                    destination: Routes.projectFaqPage,
                    args: project,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    ).onPressed(onTap: onTap);
  }
}
