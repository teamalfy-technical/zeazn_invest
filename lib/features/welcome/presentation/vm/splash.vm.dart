import 'dart:async';

import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/routes/app.pages.dart';

class ZSplashVm extends GetxController {
  static ZSplashVm get instance => Get.find();

  @override
  void onInit() {
    showSplashPage();
    super.onInit();
  }

  /// Display splash screen
  /// check if user is logged in or not
  /// [showSplashPage]
  void showSplashPage() async {
    Timer(Duration(seconds: 3), () {
      if (ZSecureStorage().readData(ZSecureStorage().onboardingKey) == null) {
        ZHelperFunction.switchScreen(
          destination: Routes.creatorOnboardingPage,
          replace: true,
        );
      } else {
        if (ZSecureStorage().getAuthResponse() != null) {
          if (ZSecureStorage().getAuthResponse()?.role == UserRole.investor) {
            ZHelperFunction.switchScreen(
              destination: Routes.supporterDashboardPage,
              replace: true,
            );
          } else {
            // ZHelperFunction.switchScreen(
            //   destination: Routes.signupStep4,
            //   replace: true,
            // );
            ZHelperFunction.switchScreen(
              destination: Routes.creatorDashboardPage,
              replace: true,
            );
          }
        } else {
          ZHelperFunction.switchScreen(
            destination: Routes.loginPage,
            replace: true,
          );
        }
      }
    });
  }
}
