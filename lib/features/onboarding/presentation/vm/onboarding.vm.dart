import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/auth/signup/presentation/vm/signup.vm.dart';
import 'package:zeazn_invest_app/features/onboarding/domain/models/onboarding.model.dart';
import 'package:zeazn_invest_app/routes/app.pages.dart';

class ZOnboardingVm extends GetxController {
  static ZOnboardingVm get instance => Get.find();

  var cPageIndex = 0.obs;
  var sPageIndex = 0.obs;

  final PageController creatorPageController = PageController();
  final PageController supporterPageController = PageController();

  onCreatorPageChanged(int val) {
    cPageIndex.value = val;
  }

  onSupporterPageChanged(int val) {
    sPageIndex.value = val;
  }

  // navigate between slides on creator onboarding page
  navigateToNextScreen() {
    if (cPageIndex.value < creatorSlides.length - 1) {
      cPageIndex.value++;
      creatorPageController.animateToPage(
        cPageIndex.value,
        duration: const Duration(milliseconds: ZAppSize.s500),
        curve: Curves.fastOutSlowIn,
      );
    } else {
      markAsCompleted(UserRole.creator);
    }
  }

  // mark onboarding as completed
  markAsCompleted(UserRole role) {
    ZSecureStorage().saveData(ZSecureStorage().onboardingKey, true);
    Get.find<ZSignupVm>().setRole(role);
    // navigate to sign up
    ZHelperFunction.switchScreen(
      destination: Routes.signupStep1,
      replace: true,
    );
  }

  // navigate between slides on supporter onboarding page
  navigateToNextScreen2() {
    if (sPageIndex.value < supporterSlides.length - 1) {
      sPageIndex.value++;
      supporterPageController.animateToPage(
        sPageIndex.value,
        duration: const Duration(milliseconds: ZAppSize.s500),
        curve: Curves.fastOutSlowIn,
      );
    } else {
      markAsCompleted(UserRole.investor);
    }
  }
}
