import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/onboarding/onboarding.dart';
import 'package:zeazn_invest_app/shared/widgets/custom.button.dart';

class ZCreatorOnboardingPage extends StatelessWidget {
  ZCreatorOnboardingPage({super.key});

  final ctrl = Get.put(ZOnboardingVm());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Stack(
          children: [
            PageView.builder(
              controller: ctrl.creatorPageController,
              itemCount: creatorSlides.length,
              onPageChanged: ctrl.onCreatorPageChanged,
              itemBuilder: (context, index) {
                final slide = creatorSlides[index];
                return ZOnboardingWidget(
                  pageIndex: ctrl.cPageIndex.value,
                  imagePath: slide.image,
                  title: slide.title,
                  subtitle: slide.description,
                );
                // return POnboardingWidget(slide: slide, ctrl: ctrl);
              },
            ),
            Positioned(
              left: ZAppSize.s14,
              right: ZAppSize.s14,
              top:
                  ctrl.cPageIndex.value == 3
                      ? ZDeviceUtil.getDeviceHeight(context) * 0.443
                      : ZDeviceUtil.getDeviceHeight(context) * 0.43,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children:
                        creatorSlides
                            .asMap()
                            .map(
                              (i, e) => MapEntry(
                                i,
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 2,
                                  ),
                                  width: ctrl.cPageIndex.value == i ? 14 : 10,
                                  height: ctrl.cPageIndex.value == i ? 14 : 10,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                        ctrl.cPageIndex.value == i
                                            ? ZAppColor.secondary
                                            : Color(0XFF474444),
                                  ),
                                ),
                              ),
                            )
                            .values
                            .toList(),
                  ),

                  ctrl.cPageIndex.value == 3
                      ? SizedBox.shrink()
                      : SizedBox(
                        width: ZDeviceUtil.getDeviceWidth(context) * 0.42,
                        child: ZCustomButton(
                          label:
                              (ctrl.cPageIndex.value == 4 ||
                                      ctrl.cPageIndex.value == 5)
                                  ? 'next'.tr
                                  : 'continue'.tr,
                          onTap: () => ctrl.navigateToNextScreen(),
                        ),
                      ),

                  // SizedBox(
                  //   width: 200,
                  //   child: ElevatedButton.icon(
                  //     onPressed: () {},
                  //     iconAlignment: IconAlignment.end,
                  //     label: Text('continue'.tr),
                  //     icon: Assets.icons.arrowRectIcon.svg(height: 25),
                  //   ),
                  // ),
                  // text title && description
                  // Text(
                  //   slides[ctrl.pageIndex.value].title,
                  //   maxLines: 2,
                  //   style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  //     fontSize: ZAppSize.s24,
                  //     color:
                  //         ZHelperFunction.isDarkMode(context)
                  //             ? ZAppColor.whiteColor
                  //             : ZAppColor.primaryTextColor,
                  //   ),
                  // ),
                  // ZAppSize.s12.verticalSpace,
                  // slides[ctrl.pageIndex.value].description,
                  // Text(
                  //   slides[ctrl.pageIndex.value].description,
                  //   maxLines: 3,
                  //   style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  //     fontSize: ZAppSize.s16,
                  //     color:
                  //         ZHelperFunction.isDarkMode(context)
                  //             ? ZAppColor.whiteColor
                  //             : ZAppColor.text700,
                  //   ),
                  // ),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children:
                  //       slides
                  //           .asMap()
                  //           .map(
                  //             (i, e) => MapEntry(
                  //               i,
                  //               Container(
                  //                 margin: const EdgeInsets.symmetric(
                  //                   horizontal: 4,
                  //                 ),
                  //                 width: ctrl.pageIndex.value == i ? 14 : 10,
                  //                 height: ctrl.pageIndex.value == i ? 14 : 10,
                  //                 decoration: BoxDecoration(
                  //                   shape: BoxShape.circle,
                  //                   color:
                  //                       ctrl.pageIndex.value == i
                  //                           ? PAppColor.primary
                  //                           : PAppColor.greyColor,
                  //                 ),
                  //               ),
                  //             ),
                  //           )
                  //           .values
                  //           .toList(),
                  // ),
                  // PAppSize.s16.verticalSpace,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
