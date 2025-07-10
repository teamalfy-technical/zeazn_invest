import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/creator/explore/explore.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';
import 'package:zeazn_invest_app/shared/shared.dart';

class ZProjectDetailPage extends StatelessWidget {
  final Project project;
  ZProjectDetailPage({super.key, required this.project});

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
          Icon(
            Icons.arrow_back_ios,
            color: ZAppColor.blackColor,
          ).onPressed(onTap: () => ZHelperFunction.pop()),
          ZAppSize.s8.verticalSpace,
          ZProjectDetailWidget(project: project),
          ZAppSize.s8.verticalSpace,

          Container(
            // margin: EdgeInsets.only(bottom: ZAppSize.s18),
            padding: EdgeInsets.symmetric(
              vertical: ZAppSize.s14,
              horizontal: ZAppSize.s28,
            ),
            decoration: BoxDecoration(
              color: ZAppColor.blackColor,
              borderRadius: BorderRadius.circular(ZAppSize.s10),
            ),
            child: Text('exclusive_experiences'.tr),
          ),
          ZAppSize.s16.verticalSpace,
          SizedBox(
            height: ZDeviceUtil.getDeviceHeight(context) / 4.2,
            child: ListView.builder(
              itemCount: ctrl.exclusiveExperiences.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final experience = ctrl.exclusiveExperiences[index];
                return Obx(
                  () => ExclusiveExperiencesWidget(
                    deal: experience,
                    isSelected: ctrl.selectedExperienceIndex.value == index,
                  ),
                );
              },
            ),
          ),
        ],
      ).scrollable(),
    );
  }
}
