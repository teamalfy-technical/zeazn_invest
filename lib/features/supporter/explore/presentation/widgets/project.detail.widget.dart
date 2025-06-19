import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/creator/explore/explore.dart';

class ZProjectDetailWidget extends StatelessWidget {
  final Project project;
  final Function()? onTap;
  const ZProjectDetailWidget({super.key, required this.project, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: ZAppSize.s18),
      padding: EdgeInsets.all(ZAppSize.s18),
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
              ),
              ZAppSize.s14.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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

          // Project rating
          Row(
            children: [
              Text(
                '${'project_rating'.tr}:',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
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
                    (context, _) => Icon(Icons.star, color: ZAppColor.primary),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ],
          ),

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
                  Text(
                    'view_supporters'.tr,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: ZAppColor.primary,
                    ),
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
          Align(
            alignment: Alignment.bottomLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'project_budget'.tr,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
                ),
                ZAppSize.s6.verticalSpace,
                Text(
                  ZFormatter.formatCurrency(amount: project.targetAmount ?? 0),
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),

          ZAppSize.s16.verticalSpace,

          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              '📍 Blue Note Jazz Club, New York City',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: ZAppSize.s12,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),

          ZAppSize.s16.verticalSpace,

          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              'Slots Available: 8/20',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: ZAppSize.s12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),

          ZAppSize.s8.verticalSpace,

          LinearProgressIndicator(
            minHeight: ZAppSize.s15,
            borderRadius: BorderRadius.circular(ZAppSize.s12),
            value: 0.6,
            backgroundColor: ZAppColor.primary.withOpacityExt(ZAppSize.s0_2),
            valueColor: AlwaysStoppedAnimation(ZAppColor.primary),
          ),

          ZAppSize.s4.verticalSpace,
        ],
      ),
    ).onPressed(onTap: onTap);
  }
}
