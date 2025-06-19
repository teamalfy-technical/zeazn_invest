import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/creator/profile/profile.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';
import 'package:zeazn_invest_app/shared/shared.dart';

class ZUploadLegalDocPage extends StatelessWidget {
  ZUploadLegalDocPage({super.key});

  final ctrl = Get.put(ZProfileVM());

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

          SizedBox(
            height: ZDeviceUtil.getDeviceHeight(context) * 0.25,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: ZAppColor.whiteColor,
                      borderRadius: BorderRadius.circular(ZAppSize.s20),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(Assets.images.legalDocImg.path),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: ZAppSize.s24,
                  left: ZAppSize.s0,
                  right: ZAppSize.s0,
                  child: Text(
                    'legal_financial_details'.tr,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: ZAppColor.blackColor,
                      fontSize: ZAppSize.s22,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),

          ZAppSize.s16.verticalSpace,

          ZPageTagWidget(
            tag: 'documentation'.tr,
            isCentered: false,
            width: ZDeviceUtil.getDeviceWidth(context) * 0.50,
          ),

          Obx(
            () =>
                ctrl.legalDocs.isEmpty
                    ? Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Spacer(),
                          Text(
                            'no_legal_docs'.tr,
                            textAlign: TextAlign.center,
                            style: Theme.of(
                              context,
                            ).textTheme.titleLarge?.copyWith(
                              color: ZAppColor.blackColor,
                              fontSize: ZAppSize.s16,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Spacer(),
                          ZPageTagWidget(
                            tag: 'upload_legal_docs'.tr,
                            width: ZDeviceUtil.getDeviceWidth(context) * 0.35,
                            fontSize: ZAppSize.s10,
                            borderRadius: ZAppSize.s10,
                            fontWeight: FontWeight.w500,
                          ).onPressed(onTap: () => ctrl.chooseFiles()),
                          Spacer(),
                        ],
                      ),
                    )
                    : Expanded(
                      child: Column(
                        children: [
                          ZAppSize.s16.verticalSpace,
                          SizedBox(
                            height: ZDeviceUtil.getDeviceHeight(context) * 0.12,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: ctrl.legalDocs.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: EdgeInsets.all(ZAppSize.s8),
                                  margin: EdgeInsets.only(right: ZAppSize.s50),
                                  width:
                                      ZDeviceUtil.getDeviceWidth(context) *
                                      0.50,
                                  // height:
                                  //     ZDeviceUtil.getDeviceHeight(context) *
                                  //     0.15,
                                  decoration: BoxDecoration(
                                    color: ZAppColor.transparentColor,
                                    borderRadius: BorderRadius.circular(
                                      ZAppSize.s6,
                                    ),
                                    border: Border.all(
                                      width: ZAppSize.s1,
                                      color: ZAppColor.blackColor,
                                    ),
                                    // image: DecorationImage(
                                    //   fit: BoxFit.contain,
                                    //   image: FileImage(ctrl.legalDocs[index]),
                                    // ),
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        Assets.images.pdfThumbnail.path,
                                        fit: BoxFit.cover,
                                      ),
                                      Expanded(
                                        child: Text(
                                          ctrl.legalDocs[index].path
                                              .split('/')
                                              .last
                                              .split('.')
                                              .first,
                                          textAlign: TextAlign.center,
                                          style: Theme.of(
                                            context,
                                          ).textTheme.bodySmall?.copyWith(
                                            color: ZAppColor.blackColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),

                          Spacer(),

                          ZAppSize.s16.verticalSpace,

                          ZCustomOutlinedButton(
                            onTap: () => ctrl.chooseFiles(),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'upload_from_device'.tr,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodySmall?.copyWith(
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                ZAppSize.s20.horizontalSpace,
                                Assets.icons.arrowRectDiag.svg(
                                  height: ZAppSize.s32,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
          ),

          // ZAppSize.s16.verticalSpace,
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: 6,
          //     shrinkWrap: true,
          //     itemBuilder: (context, index) {
          //       return Container(
          //         margin: EdgeInsets.only(bottom: ZAppSize.s10),
          //         padding: EdgeInsets.symmetric(
          //           vertical: ZAppSize.s18,
          //           horizontal: ZAppSize.s18,
          //         ),
          //         decoration: BoxDecoration(
          //           color: ZAppColor.blackColor,
          //           borderRadius: BorderRadius.circular(ZAppSize.s10),
          //         ),
          //         child: Column(
          //           children: [
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Text(
          //                   'Angela White',
          //                   style: Theme.of(context).textTheme.bodyLarge,
          //                 ),
          //                 Text(
          //                   '${'date'.tr}: 11/08/2024',
          //                   style: Theme.of(context).textTheme.bodyMedium,
          //                 ),
          //               ],
          //             ),
          //             ZAppSize.s14.verticalSpace,
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Expanded(
          //                   child: Text(
          //                     '${'amount_supported_with'.tr}: GHS3,000',
          //                     style: Theme.of(context).textTheme.bodyMedium,
          //                   ),
          //                 ),
          //                 Text(
          //                   '${'time'.tr}: 02:00 GMT',
          //                   style: Theme.of(context).textTheme.bodyMedium,
          //                 ),
          //               ],
          //             ),
          //           ],
          //         ),
          //       );
          //     },
          //   ),
          // ),
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
