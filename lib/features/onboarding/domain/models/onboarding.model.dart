import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/onboarding/onboarding.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';
import 'package:zeazn_invest_app/routes/app.pages.dart';
import 'package:zeazn_invest_app/shared/widgets/custom.button.left.dart';
import 'package:zeazn_invest_app/shared/widgets/custom.button.right.dart';

class ZOnboardingModel {
  final String image;
  final String title;
  final Widget description;

  ZOnboardingModel({
    required this.image,
    required this.title,
    required this.description,
  });
}

final creatorSlides = [
  ZOnboardingModel(
    image: Assets.images.slideOne.path,
    title: 'slide_title'.tr,
    description: Assets.icons.logoLight.svg(
      height: ZAppSize.s50,
    ), //  Image.asset(Assets.images.logoLight.path),
  ),
  ZOnboardingModel(
    image: Assets.images.slideTwo.path,
    title: 'slide_two_title'.tr,
    description: Text(
      'slide_two_desc'.tr,
      textAlign: TextAlign.justify,
      style: TextStyle(color: ZAppColor.whiteColor, fontSize: ZAppSize.s17),
    ),
  ),
  ZOnboardingModel(
    image: Assets.images.slideThree.path,
    title: 'slide_three_title'.tr,
    description: Text(
      'slide_three_desc'.tr,
      textAlign: TextAlign.justify,
      style: TextStyle(color: ZAppColor.whiteColor, fontSize: ZAppSize.s17),
    ),
  ),
  ZOnboardingModel(
    image: Assets.images.slideFour.path,
    title: 'slide_four_title'.tr,
    description: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ZCustomButtonRight(
          label: 'creators'.tr,
          onTap: () => Get.put(ZOnboardingVm()).navigateToNextScreen(),
        ),
        ZAppSize.s8.verticalSpace,
        ZCustomButtonLeft(
          label: 'supporters'.tr,
          onTap:
              () => ZHelperFunction.switchScreen(
                destination: Routes.supporterOnboardingPage,
              ),
        ),
      ],
    ),
  ),
  ZOnboardingModel(
    image: Assets.images.slideFive.path,
    title: 'slide_five_title'.tr,
    description: Text(
      'slide_five_desc'.tr,
      textAlign: TextAlign.center,
      style: TextStyle(color: ZAppColor.whiteColor, fontSize: ZAppSize.s17),
    ),
  ),
  ZOnboardingModel(
    image: Assets.images.slideSix.path,
    title: 'slide_six_title'.tr,
    description: Text(
      'slide_six_desc'.tr,
      textAlign: TextAlign.center,
      style: TextStyle(color: ZAppColor.whiteColor, fontSize: ZAppSize.s17),
    ),
  ),
];

final supporterSlides = [
  ZOnboardingModel(
    image: Assets.images.slideThree.path,
    title: 'supporter_slide_one_title'.tr,
    description: Text(
      'supporter_slide_one_desc'.tr,
      textAlign: TextAlign.center,
      style: TextStyle(color: ZAppColor.whiteColor, fontSize: ZAppSize.s17),
    ),
  ),
  ZOnboardingModel(
    image: Assets.images.supporterSlideTwo.path,
    title: 'supporter_slide_two_title'.tr,
    description: Text(
      'supporter_slide_two_desc'.tr,
      textAlign: TextAlign.center,
      style: TextStyle(color: ZAppColor.whiteColor, fontSize: ZAppSize.s17),
    ),
  ),
  ZOnboardingModel(
    image: Assets.images.supporterSlideThree.path,
    title: 'supporter_slide_three_title'.tr,
    description: Text(
      'supporter_slide_three_desc'.tr,
      textAlign: TextAlign.center,
      style: TextStyle(color: ZAppColor.whiteColor, fontSize: ZAppSize.s17),
    ),
  ),
];
