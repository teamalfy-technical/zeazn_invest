import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/creator/explore/presentation/pages/tabs/projects.list.tab.dart';
import 'package:zeazn_invest_app/features/creator/explore/presentation/pages/tabs/trending.projects.tab.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';

class ZExplorePage extends StatelessWidget {
  const ZExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ZAppSize.s16.verticalSpace,
        // profile image widget
        Container(
          padding: EdgeInsets.all(ZAppSize.s20),
          decoration: BoxDecoration(
            color: ZAppColor.blackColor,
            borderRadius: BorderRadius.circular(ZAppSize.s20),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: ZAppSize.s25,
                backgroundImage: AssetImage(Assets.images.slideTwo.path),
              ),
              Expanded(
                child: Text(
                  '${'welcome_back'.tr}, Sarah!',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ],
          ),
        ),

        ZAppSize.s20.verticalSpace,
        ClipRRect(
          borderRadius: BorderRadius.circular(ZAppSize.s8),
          child: Container(
            height: ZAppSize.s36,
            // margin: const EdgeInsets.symmetric(horizontal: ZAppSize.s20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ZAppSize.s8),
              // color: ZAppColor.blackColor.withOpacityExt(ZAppSize.s0_5),
              border: Border.all(color: ZAppColor.primary),
            ),
            child: TabBar(
              // controller: contactCubit.tabController,
              indicatorColor: ZAppColor.transparentColor,
              dividerColor: ZAppColor.transparentColor,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                color: ZAppColor.blackColor,
                borderRadius: BorderRadius.circular(ZAppSize.s8),
              ),
              labelColor: ZAppColor.whiteColor,
              unselectedLabelColor: ZAppColor.blackColor,
              tabs: [
                Tab(text: 'project_list'.tr),
                Tab(text: 'trending_projects'.tr),
              ],
            ),
          ),
        ),
        ZAppSize.s20.verticalSpace,
        Expanded(
          child: TabBarView(
            // controller: contactCubit.tabController,
            children: [
              ZProjectListTab(),
              ZTrendingProjectsTab(),

              // HUnReadMessageTab(isUnRead: true),
            ],
          ),
        ),
      ],
    );
  }
}
