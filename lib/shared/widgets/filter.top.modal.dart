import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/creator/explore/explore.dart';

class ZFilterTopModal extends StatelessWidget {
  final dynamic ctrl;
  const ZFilterTopModal({super.key, required this.ctrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ZDeviceUtil.getDeviceWidth(context),
      height: ZDeviceUtil.getDeviceHeight(context) / 3.5,
      // margin: EdgeInsets.only(top: 50), // space from top
      padding: EdgeInsets.symmetric(
        // vertical: ZDeviceUtil.getDeviceHeight(context) * 0.08,
        horizontal: ZAppSize.s50,
      ),
      decoration: BoxDecoration(
        color: ZAppColor.offWhiteColor,
        // borderRadius: BorderRadius.circular(12),
      ),
      child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ZAppSize.s90.verticalSpace,
              Text(
                'filter_by'.tr,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: ZAppColor.blackColor,
                  // fontSize: ZAppSize.s10,
                ),
              ).symmetric(horizontal: ZAppSize.s8),
              ZAppSize.s6.verticalSpace,
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ZRadioListTileWidget(
                      label: 'country'.tr,
                      value: 'country',
                      groupValue: ctrl.selectedFilterOption.value,
                      onChanged: ctrl.onFilterOptionChanged,
                    ),
                    ZRadioListTileWidget(
                      label: 'city'.tr,
                      value: 'city',
                      groupValue: ctrl.selectedFilterOption.value,
                      onChanged: ctrl.onFilterOptionChanged,
                    ),
                    ZRadioListTileWidget(
                      label: 'category'.tr,
                      value: 'category',
                      groupValue: ctrl.selectedFilterOption.value,
                      onChanged: ctrl.onFilterOptionChanged,
                    ),
                  ],
                ),
              ),
              ZAppSize.s10.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildFilterButton(
                    context: context,
                    label: 'apply_filters'.tr,
                    onTap: () {},
                    foregroundColor: ZAppColor.whiteColor,
                    backgroundColor: ZAppColor.primary,
                    side: null,
                  ),
                  ZAppSize.s8.horizontalSpace,
                  buildFilterButton(
                    context: context,
                    label: 'cancel'.tr,
                    onTap: () {
                      ZHelperFunction.pop();
                    },
                    foregroundColor: ZAppColor.blackColor,
                    textColor: ZAppColor.blackColor,
                    backgroundColor: ZAppColor.transparentColor,
                    side: BorderSide(
                      width: ZAppSize.s1,
                      color: ZAppColor.blackColor,
                    ),
                  ),
                ],
              ),
            ],
          ).scrollable(),
    );
  }

  Widget buildFilterButton({
    required BuildContext context,
    required String label,
    required Function()? onTap,
    Color? foregroundColor,
    Color? textColor,
    Color? backgroundColor,
    BorderSide? side,
  }) {
    return SizedBox(
      width: ZDeviceUtil.getDeviceWidth(context) * 0.30,
      height: ZDeviceUtil.getDeviceHeight(context) * 0.03,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: ZAppSize.s0),
          foregroundColor: foregroundColor,
          backgroundColor: backgroundColor,
          side: side,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ZAppSize.s16),
          ),
        ),
        child: Text(
          label,
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: textColor),
        ),
      ),
    );
  }
}
