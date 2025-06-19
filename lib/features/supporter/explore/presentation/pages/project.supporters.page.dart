import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/creator/explore/explore.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';
import 'package:zeazn_invest_app/shared/shared.dart';

class ZProjectSupportersPage extends StatelessWidget {
  ZProjectSupportersPage({super.key});

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

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'project_supporters'.tr,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: ZAppColor.blackColor),
              ),
              // SOrt by
              Container(
                padding: EdgeInsets.only(
                  top: ZAppSize.s7,
                  bottom: ZAppSize.s7,
                  left: ZAppSize.s14,
                  right: ZAppSize.s6,
                ),
                decoration: BoxDecoration(
                  color: ZAppColor.whiteColor,
                  borderRadius: BorderRadius.circular(ZAppSize.s20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'sort_by'.tr,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: ZAppColor.blackColor,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      weight: 1,
                      color: ZAppColor.blackColor,
                      size: 25,
                    ),
                  ],
                ),
              ).onPressed(
                onTap: () {
                  showTopModal(
                    context,
                    Container(
                      height: ZDeviceUtil.getDeviceHeight(context) * 0.35,
                      decoration: BoxDecoration(
                        color: ZAppColor.offWhiteColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(ZAppSize.s14),
                          bottomRight: Radius.circular(ZAppSize.s14),
                        ),
                      ),
                      child:
                          Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: ZDeviceUtil.getDeviceWidth(context),
                                padding: EdgeInsets.only(
                                  top: ZAppSize.s70,
                                  bottom: ZAppSize.s20,
                                ),
                                decoration: BoxDecoration(
                                  color: ZAppColor.whiteColor,
                                ),
                                child: Text(
                                  'sort_by'.tr,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.headlineSmall?.copyWith(
                                    color: ZAppColor.blackColor,
                                    // fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),

                              ZAppSize.s8.verticalSpace,

                              // Sort (High to low)
                              SortWIdget(
                                label: 'support_level_1'.tr,
                                value: false,
                                onChanged: (val) {},
                              ),
                              ZAppSize.s8.verticalSpace,
                              // Sort (Low to High)
                              SortWIdget(
                                label: 'support_level_2'.tr,
                                value: false,
                                onChanged: (val) {},
                              ),
                              ZAppSize.s20.verticalSpace,
                              SizedBox(
                                width:
                                    ZDeviceUtil.getDeviceWidth(context) * 0.45,
                                height:
                                    ZDeviceUtil.getDeviceHeight(context) *
                                    0.045,
                                child: ZCustomButton(
                                  label: 'apply'.tr,
                                  radius: ZAppSize.s8,
                                  fontSize: ZAppSize.s14,
                                  icon: Assets.icons.arrowRectDiag.svg(
                                    height: ZAppSize.s32,
                                  ),
                                  onTap: () {},
                                ),
                              ),
                              ZAppSize.s8.verticalSpace,
                            ],
                          ).scrollable(),
                    ),
                  );
                },
                radius: BorderRadius.circular(ZAppSize.s20),
              ),
            ],
          ),
          ZAppSize.s16.verticalSpace,
          Expanded(
            child: ListView.builder(
              itemCount: 6,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: ZAppSize.s10),
                  padding: EdgeInsets.symmetric(
                    vertical: ZAppSize.s18,
                    horizontal: ZAppSize.s18,
                  ),
                  decoration: BoxDecoration(
                    color: ZAppColor.blackColor,
                    borderRadius: BorderRadius.circular(ZAppSize.s10),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Angela White',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            '${'date'.tr}: 11/08/2024',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      ZAppSize.s14.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              '${'amount_supported_with'.tr}: GHS3,000',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          Text(
                            '${'time'.tr}: 02:00 GMT',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void showTopModal(BuildContext context, Widget child) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "TopModal",
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Align(
          alignment: Alignment.topCenter,
          child: Material(color: Colors.transparent, child: child),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, widget) {
        final curvedValue = Curves.easeInOut.transform(animation.value);
        return Transform.translate(
          offset: Offset(0, -200 + (200 * curvedValue)), // slide in from top
          child: Opacity(opacity: animation.value, child: widget),
        );
      },
    );
  }
}

class SortWIdget extends StatelessWidget {
  final String label;
  final bool value;
  final Function(bool?)? onChanged;
  const SortWIdget({
    super.key,
    required this.label,
    required this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ZDeviceUtil.getDeviceWidth(context),
      padding: EdgeInsets.symmetric(
        horizontal: ZAppSize.s10,
        // vertical: ZAppSize.s4,
      ),
      decoration: BoxDecoration(color: ZAppColor.whiteColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: ZAppColor.blackColor,
              // fontWeight: FontWeight.w300,
            ),
          ),
          Checkbox(
            value: value,
            onChanged: onChanged,
            fillColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return ZAppColor.primary;
              } else {
                return ZAppColor.transparentColor;
              }
            }),
            side: BorderSide(width: ZAppSize.s1, color: ZAppColor.blackColor),
          ),
        ],
      ),
    );
  }
}
