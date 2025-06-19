import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/creator/explore/explore.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';
import 'package:zeazn_invest_app/shared/shared.dart';

class ZProjectReviewsPage extends StatelessWidget {
  final Project project;
  ZProjectReviewsPage({super.key, required this.project});

  final ctrl = Get.put(ZExploreVM());

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> reviews = [
      {
        'user': {'name': 'Sarah Donot', 'image': 'https://picsum.photos/200'},
        'rating': 3.5,
        'review': 'Listened to some of your music and I was really...',
      },
      {
        'user': {'name': 'Sarah Donot', 'image': 'https://picsum.photos/200'},
        'rating': 4.5,
        'review': 'Listened to some of your music and I was really...',
      },
      {
        'user': {'name': 'Sarah Donot', 'image': 'https://picsum.photos/200'},
        'rating': 3.0,
        'review': 'Listened to some of your music and I was really...',
      },
      {
        'user': {'name': 'Sarah Donot', 'image': 'https://picsum.photos/200'},
        'rating': 3.0,
        'review': 'Listened to some of your music and I was really...',
      },
      {
        'user': {'name': 'Sarah Donot', 'image': 'https://picsum.photos/200'},
        'rating': 3.0,
        'review': 'Listened to some of your music and I was really...',
      },
    ];
    return ZZeaznScaffold(
      backgroundColor: ZAppColor.offWhiteColor,
      logoPath: Assets.icons.logoDark.svg(height: ZAppSize.s55),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ZAppSize.s8.verticalSpace,
          Align(
            alignment: Alignment.topLeft,
            child: Icon(
              Icons.arrow_back_ios,
              color: ZAppColor.blackColor,
            ).onPressed(onTap: () => ZHelperFunction.pop()),
          ),
          ZAppSize.s12.verticalSpace,

          Text(
            'project_reviews'.tr,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
              letterSpacing: ZAppSize.s2,
              color: ZAppColor.blackColor,
            ),
          ),

          ZAppSize.s10.verticalSpace,
          Text(
            'overall_rating'.tr,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w300,
              color: ZAppColor.blackColor,
            ),
          ),

          ZAppSize.s16.verticalSpace,

          Text(
            '4.0',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.w700,
              color: ZAppColor.blackColor,
              fontSize: ZAppSize.s40,
            ),
          ),

          ZAppSize.s4.verticalSpace,

          RatingBar.builder(
            initialRating: 4,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: ZAppSize.s22,
            // itemPadding: EdgeInsets.zero,
            itemBuilder:
                (context, _) => Icon(Icons.star, color: ZAppColor.primary),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),

          ZAppSize.s32.verticalSpace,
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                final review = reviews[index];
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: ZAppSize.s34,
                      backgroundImage: NetworkImage(
                        review['user']['image'] ?? '',
                      ),
                    ),
                    ZAppSize.s8.horizontalSpace,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            review['user']['name'],
                            style: Theme.of(
                              context,
                            ).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: ZAppColor.blackColor,
                              fontSize: ZAppSize.s12,
                            ),
                          ),
                          RatingBar.builder(
                            initialRating: review['rating'] ?? 0,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: ZAppSize.s16,
                            // itemPadding: EdgeInsets.zero,
                            itemBuilder:
                                (context, _) =>
                                    Icon(Icons.star, color: ZAppColor.primary),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          Text(
                            review['review'],
                            style: Theme.of(
                              context,
                            ).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w400,
                              color: ZAppColor.blackColor,
                              fontSize: ZAppSize.s12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      ZFormatter.convertToAgo(
                        DateTime.now().subtract(Duration(days: 2)),
                      ),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w300,
                        color: ZAppColor.text300,
                        fontSize: ZAppSize.s10,
                      ),
                    ),
                  ],
                ).only(bottom: ZAppSize.s30);
              },
            ),
          ),

          // Expanded(
          //   child: ListView.builder(
          //     itemCount: 3,
          //     shrinkWrap: true,
          //     itemBuilder: (context, index) {
          //       return Column(
          //         children: [
          //           Container(
          //             // margin: EdgeInsets.only(bottom: ZAppSize.s18),
          //             padding: EdgeInsets.symmetric(
          //               vertical: ZAppSize.s20,
          //               horizontal: ZAppSize.s25,
          //             ),
          //             decoration: BoxDecoration(
          //               color: ZAppColor.blackColor,
          //               borderRadius: BorderRadius.circular(ZAppSize.s10),
          //             ),
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Text(
          //                   'Title: New features for August',
          //                   style: Theme.of(
          //                     context,
          //                   ).textTheme.bodySmall?.copyWith(
          //                     fontWeight: FontWeight.w700,
          //                     color: ZAppColor.whiteColor,
          //                   ),
          //                 ),
          //                 ZAppSize.s6.verticalSpace,
          //                 Text(
          //                   'Date : 11/08/2024',
          //                   style: Theme.of(
          //                     context,
          //                   ).textTheme.bodySmall?.copyWith(
          //                     fontWeight: FontWeight.w500,
          //                     color: ZAppColor.whiteColor,
          //                   ),
          //                 ),
          //                 ZAppSize.s6.verticalSpace,
          //                 Text(
          //                   'This "Updates" section ensures that backers stay informed about the campaign’s progress, feel engaged, and can interact with the creator and other community members,',
          //                   style: Theme.of(
          //                     context,
          //                   ).textTheme.bodySmall?.copyWith(
          //                     fontWeight: FontWeight.w400,
          //                     color: ZAppColor.text200,
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //           ZAppSize.s6.verticalSpace,

          //           Container(
          //             // padding: EdgeInsets.symmetric(
          //             //   vertical: ZAppSize.s20,
          //             //   horizontal: ZAppSize.s25,
          //             // ),
          //             decoration: BoxDecoration(
          //               color: ZAppColor.blackColor,
          //               borderRadius: BorderRadius.circular(ZAppSize.s10),
          //             ),
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //               children: [
          //                 TextButton.icon(
          //                   icon: Assets.icons.chatIcon.svg(),
          //                   onPressed: () {},
          //                   label: Text(
          //                     '45 ${'comments'.tr.toLowerCase()}',
          //                     style: Theme.of(
          //                       context,
          //                     ).textTheme.bodySmall?.copyWith(
          //                       fontWeight: FontWeight.w400,
          //                       fontSize: ZAppSize.s12,
          //                       color: ZAppColor.whiteColor,
          //                     ),
          //                   ),
          //                 ),
          //                 TextButton.icon(
          //                   icon: Assets.icons.sharesIcon.svg(),
          //                   iconAlignment: IconAlignment.start,
          //                   onPressed: () {},
          //                   label: Text(
          //                     '1,200 ${'shares'.tr.toLowerCase()}',
          //                     style: Theme.of(
          //                       context,
          //                     ).textTheme.bodySmall?.copyWith(
          //                       fontWeight: FontWeight.w400,
          //                       fontSize: ZAppSize.s12,
          //                       color: ZAppColor.whiteColor,
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //           ZAppSize.s20.verticalSpace,
          //         ],
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
