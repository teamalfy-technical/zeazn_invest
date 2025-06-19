import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/onboarding/onboarding.dart';
import 'package:zeazn_invest_app/shared/widgets/custom.button.dart';

class ZSupporterOnboardingPage extends StatelessWidget {
  ZSupporterOnboardingPage({super.key});

  final ctrl = Get.put(ZOnboardingVm());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Stack(
          children: [
            PageView.builder(
              controller: ctrl.supporterPageController,
              itemCount: supporterSlides.length,
              onPageChanged: ctrl.onSupporterPageChanged,
              itemBuilder: (context, index) {
                final slide = supporterSlides[index];
                return ZOnboardingWidget(
                  pageIndex: ctrl.sPageIndex.value,
                  imagePath: slide.image,
                  title: slide.title,
                  subtitle: slide.description,
                );
              },
            ),
            Positioned(
              left: ZAppSize.s14,
              right: ZAppSize.s14,
              top: ZDeviceUtil.getDeviceHeight(context) * 0.43,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children:
                        supporterSlides
                            .asMap()
                            .map(
                              (i, e) => MapEntry(
                                i,
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: ZAppSize.s2,
                                  ),
                                  width: ctrl.sPageIndex.value == i ? 14 : 10,
                                  height: ctrl.sPageIndex.value == i ? 14 : 10,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                        ctrl.sPageIndex.value == i
                                            ? ZAppColor.secondary
                                            : Color(0XFF474444),
                                  ),
                                ),
                              ),
                            )
                            .values
                            .toList(),
                  ),
                  SizedBox(
                    width: ZDeviceUtil.getDeviceWidth(context) * 0.42,
                    child: ZCustomButton(
                      label: 'next'.tr,
                      onTap: () => ctrl.navigateToNextScreen2(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
