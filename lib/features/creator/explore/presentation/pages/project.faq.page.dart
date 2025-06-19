import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/creator/explore/explore.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';
import 'package:zeazn_invest_app/shared/shared.dart';

class ZProjectFaqPage extends StatelessWidget {
  final Project project;
  ZProjectFaqPage({super.key, required this.project});

  final ctrl = Get.put(ZExploreVM());

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> faqs = [
      {
        'title': 'What if I don’t get my exclusive deal?',
        'description':
            'At Zeazn we have put in place security measures that ensures each exclusive deal is given out. ID verification is in place which we use to trace creators when and if this happens. But rest assured nothing of that sought has ever happened before.',
      },
      {
        'title': 'How to apply as a creator?',
        'description':
            'At Zeazn we have put in place security measures that ensures each exclusive deal is given out. ID verification is in place which we use to trace creators when and if this happens. But rest assured nothing of that sought has ever happened before.',
      },
      {
        'title': 'How do i support a creator?',
        'description':
            'At Zeazn we have put in place security measures that ensures each exclusive deal is given out. ID verification is in place which we use to trace creators when and if this happens. But rest assured nothing of that sought has ever happened before.',
      },
    ];
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
          ZAppSize.s8.verticalSpace,

          ZAppSize.s4.verticalSpace,
          Text(
            '${'faq'.tr.toUpperCase()}\'s',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: ZAppColor.blackColor,
            ),
          ),

          ZAppSize.s40.verticalSpace,

          Divider(
            color: ZAppColor.dividerColor, // Customize the divider color here
            height: ZAppSize.s1,
            thickness: ZAppSize.s1,
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: faqs.length,
              itemBuilder: (context, index) {
                final faq = faqs[index];
                return ZCustomExpansionTile(
                  title: Text(
                    faq['title'],
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: ZAppColor.blackColor,
                    ),
                  ),
                  children: [
                    Text(
                      faq['description'],
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: ZAppColor.blackColor,
                      ),
                    ),
                    ZAppSize.s10.verticalSpace,
                  ],
                );
                // return ExpansionTile(
                //   tilePadding: EdgeInsets.zero,
                //   // childrenPadding: EdgeInsets.zero,
                //   // trailing: Icon(Icons.add),
                //   title: Text(
                //     faq['title'],
                //     style: Theme.of(context).textTheme.bodySmall?.copyWith(
                //       fontWeight: FontWeight.w700,
                //       color: ZAppColor.blackColor,
                //     ),
                //   ),
                //   children: [
                //     Text(
                //       faq['description'],
                //       style: Theme.of(context).textTheme.bodySmall?.copyWith(
                //         fontWeight: FontWeight.w400,
                //         color: ZAppColor.blackColor,
                //       ),
                //     ),
                //     ZAppSize.s10.verticalSpace,
                //   ],
                // );
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
