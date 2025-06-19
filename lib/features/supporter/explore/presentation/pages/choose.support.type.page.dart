import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/creator/explore/domain/models/project.model.dart';
import 'package:zeazn_invest_app/features/supporter/explore/presentation/vm/s.explore.vm.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';
import 'package:zeazn_invest_app/shared/shared.dart';

class ZChooseSupportTypePage extends StatelessWidget {
  final Project project;
  ZChooseSupportTypePage({super.key, required this.project});
  final ctrl = Get.find<ZSExploreVM>();

  @override
  Widget build(BuildContext context) {
    return ZZeaznScaffold(
      backgroundColor: ZAppColor.offWhiteColor,
      logoPath: Assets.icons.logoDark.svg(height: ZAppSize.s55),
      child: SafeArea(
        top: true,
        bottom: false,
        left: false,
        right: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ZAppSize.s20.verticalSpace,
            Text(
              'choose_support_to_give'.tr,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: ZAppColor.text500,
                letterSpacing: ZAppSize.s2,
                fontWeight: FontWeight.w500,
              ),
            ),
            ZAppSize.s30.verticalSpace,

            // Support types
            _buildSupportWidget(
              context: context,
              label: 'support_type_1'.tr,
              onTap: () {
                ctrl.setSupportType(SupportType.one);
                ZHelperFunction.pop();
                showSupportViaCrowdfundingDialog(
                  context: context,
                  project: project,
                  ctrl: ctrl,
                );
              },
            ),
            ZAppSize.s30.verticalSpace,
            _buildSupportWidget(
              context: context,
              label: 'support_type_2'.tr,
              onTap: () {
                ZHelperFunction.pop();
                showSupportViaExperiencesDialog(
                  context: context,
                  project: project,
                  ctrl: ctrl,
                );
              },
            ),
          ],
        ).symmetric(horizontal: ZAppSize.s6),
      ),
    );
  }

  Widget _buildSupportWidget({
    required BuildContext context,
    required String label,
    required Function()? onTap,
  }) {
    return Container(
      padding: EdgeInsets.all(ZAppSize.s12),
      decoration: BoxDecoration(
        color: ZAppColor.blackColor,
        borderRadius: BorderRadius.circular(ZAppSize.s12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: ZAppSize.s8,
              horizontal: ZAppSize.s10,
            ),
            decoration: BoxDecoration(
              color: ZAppColor.primary,
              borderRadius: BorderRadius.circular(ZAppSize.s8),
            ),
            child: Icon(Icons.attach_money, size: ZAppSize.s36),
          ),

          ZAppSize.s8.horizontalSpace,
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Text(
                    label,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                ZAppSize.s8.horizontalSpace,
                Assets.icons.arrowRightIcon.svg(),
              ],
            ),
          ),
        ],
      ),
    ).onPressed(onTap: onTap);
  }
}
