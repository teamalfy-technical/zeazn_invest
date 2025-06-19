import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/creator/explore/explore.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';
import 'package:zeazn_invest_app/shared/shared.dart';

class ZProjectUpdatesPage extends StatelessWidget {
  final Project project;
  ZProjectUpdatesPage({super.key, required this.project});

  final ctrl = Get.put(ZExploreVM());

  @override
  Widget build(BuildContext context) {
    return ZZeaznScaffold(
      backgroundColor: ZAppColor.offWhiteColor,
      logoPath: Assets.icons.logoDark.svg(height: ZAppSize.s55),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ZAppSize.s8.verticalSpace,
          // IconButton(
          //   onPressed: () => ZHelperFunction.pop(),
          //   icon:
          // ),
          Icon(
            Icons.arrow_back_ios,
            color: ZAppColor.blackColor,
          ).onPressed(onTap: () => ZHelperFunction.pop()),
          ZAppSize.s8.verticalSpace,

          // ZProjectDetailWidget(project: project),
          // ZAppSize.s8.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'project_updates'.tr,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: ZAppColor.blackColor,
                ),
              ),
              ZOutlinedIconButton(
                icon: Assets.icons.updateIcon.svg(),
                borderColor: ZAppColor.transparentColor,
                label: 'add_new_updates'.tr,
                onTap: () {},
              ),
              // ZCustomOutlinedButton(
              //   child: Row(
              //     children: [
              //       Text(
              //         'add_new_updates'.tr,
              //         style: Theme.of(context).textTheme.bodySmall?.copyWith(
              //           fontWeight: FontWeight.w700,
              //         ),
              //       ),
              //       Assets.icons.updateIcon.svg(),
              //     ],
              //   ),
              // ),
            ],
          ),

          ZAppSize.s16.verticalSpace,

          Expanded(
            child: ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      // margin: EdgeInsets.only(bottom: ZAppSize.s18),
                      padding: EdgeInsets.symmetric(
                        vertical: ZAppSize.s20,
                        horizontal: ZAppSize.s25,
                      ),
                      decoration: BoxDecoration(
                        color: ZAppColor.blackColor,
                        borderRadius: BorderRadius.circular(ZAppSize.s10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Title: New features for August',
                            style: Theme.of(
                              context,
                            ).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: ZAppColor.whiteColor,
                            ),
                          ),
                          ZAppSize.s6.verticalSpace,
                          Text(
                            'Date : 11/08/2024',
                            style: Theme.of(
                              context,
                            ).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: ZAppColor.whiteColor,
                            ),
                          ),
                          ZAppSize.s6.verticalSpace,
                          Text(
                            'This "Updates" section ensures that backers stay informed about the campaign’s progress, feel engaged, and can interact with the creator and other community members,',
                            style: Theme.of(
                              context,
                            ).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w400,
                              color: ZAppColor.text200,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ZAppSize.s6.verticalSpace,

                    Container(
                      // padding: EdgeInsets.symmetric(
                      //   vertical: ZAppSize.s20,
                      //   horizontal: ZAppSize.s25,
                      // ),
                      decoration: BoxDecoration(
                        color: ZAppColor.blackColor,
                        borderRadius: BorderRadius.circular(ZAppSize.s10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton.icon(
                            icon: Assets.icons.chatIcon.svg(),
                            onPressed: () {},
                            label: Text(
                              '45 ${'comments'.tr.toLowerCase()}',
                              style: Theme.of(
                                context,
                              ).textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: ZAppSize.s12,
                                color: ZAppColor.whiteColor,
                              ),
                            ),
                          ),
                          TextButton.icon(
                            icon: Assets.icons.sharesIcon.svg(),
                            iconAlignment: IconAlignment.start,
                            onPressed: () {},
                            label: Text(
                              '1,200 ${'shares'.tr.toLowerCase()}',
                              style: Theme.of(
                                context,
                              ).textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: ZAppSize.s12,
                                color: ZAppColor.whiteColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ZAppSize.s20.verticalSpace,
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
