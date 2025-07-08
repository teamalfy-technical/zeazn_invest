import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:redacted/redacted.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';

class ZProjectListWidgetRedact extends StatelessWidget {
  final LoadingState loading;
  final dynamic ctrl;
  const ZProjectListWidgetRedact({super.key, required this.loading, this.ctrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: ZDeviceUtil.getDeviceHeight(context) * 0.18,
          margin: EdgeInsets.only(bottom: ZAppSize.s18),
          padding: EdgeInsets.all(ZAppSize.s16),
          decoration: BoxDecoration(
            color: ZAppColor.blackColor,
            borderRadius: BorderRadius.circular(ZAppSize.s10),
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(ZAppSize.s6),
                    child: Container(
                      color: Colors.grey.shade400,
                      height: ZDeviceUtil.getDeviceHeight(context) * 0.09,
                      width: ZDeviceUtil.getDeviceWidth(context) * 0.32,
                    ),
                  ),
                  ZAppSize.s8.verticalSpace,
                  // creator info
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: ZAppSize.s16,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(ZAppSize.s16),
                          ),
                        ),
                      ),
                      ZAppSize.s8.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '*******************',
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: ZAppColor.hintTextColor,
                                  fontSize: ZAppSize.s10,
                                ),
                          ),
                          ZAppSize.s4.verticalSpace,
                          Text(
                            '*******************',
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: ZAppColor.hintTextColor,
                                  fontSize: ZAppSize.s10,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              ZAppSize.s16.horizontalSpace,

              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '************',
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: ZAppColor.whiteColor,
                                  fontSize: ZAppSize.s10,
                                ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'share'.tr,
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: ZAppColor.primary,
                                    fontSize: ZAppSize.s10,
                                  ),
                            ),
                            ZAppSize.s6.horizontalSpace,
                            Text(
                              'sha'.tr,
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: ZAppColor.primary,
                                    fontSize: ZAppSize.s10,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    ZAppSize.s8.verticalSpace,
                    Text(
                      '**************************************************************************',
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: ZAppSize.s10,
                      ),
                    ),

                    // ZAppSize.s8.verticalSpace,
                    Spacer(),

                    // share
                    // ZAppSize.s8.verticalSpace,
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        '*********************',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: ZAppColor.hintTextColor,
                          fontSize: ZAppSize.s10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // slider
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: ZDeviceUtil.getDeviceWidth(context),
              height: ZDeviceUtil.getDeviceHeight(context) * 0.025,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(ZAppSize.s8),
              ),
            ),

            Align(
              alignment: Alignment.center,
              child: Container(
                width: ZAppSize.s40,
                height: ZAppSize.s40,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  // shape: BoxShape.circle,
                  borderRadius: BorderRadius.circular(ZAppSize.s20),
                ),
              ),
            ),
          ],
        ),
        ZAppSize.s10.verticalSpace,
      ],
    ).redacted(
      context: context,
      redact: loading == LoadingState.loading ? true : false,
    );
  }
}
