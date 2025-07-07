import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/auth/login/login.dart';
import 'package:zeazn_invest_app/routes/app.pages.dart';
import 'package:zeazn_invest_app/shared/shared.dart';

class ZLoginVm extends GetxController {
  static ZLoginVm get instance => Get.find();

  final emailTEC = TextEditingController();
  final passwordTEC = TextEditingController();

  final loginFormKey = GlobalKey<FormState>();

  var obscure = true.obs;

  onObscureChanged() => obscure.value = !obscure.value;

  var role = UserRole.creator.obs;

  final context = Get.context!;

  void setRole(UserRole selectedRole) {
    role.value = selectedRole;
    zeaznLogger.e(role.value);
  }

  // Future<void> login(UserRole role) async {
  //   // zeaznLogger.e(role);
  //   if (role == UserRole.creator) {
  //     ZHelperFunction.switchScreen(
  //       destination: Routes.creatorDashboardPage,
  //       replace: true,
  //     );
  //   } else {
  //     ZHelperFunction.switchScreen(
  //       destination: Routes.supporterDashboardPage,
  //       replace: true,
  //     );
  //   }
  // }

  /// [Function] to login a user
  /// @params => context
  /// @params => role
  Future<void> login() async {
    final result = await loginService.loginUser(
      email: emailTEC.text.trim(),
      password: passwordTEC.text.trim(),
    );
    result.fold(
      (err) {
        ZPopupDialog(
          context,
        ).errorMessage(title: 'error'.tr, message: err.message);
      },
      (res) {
        if (res.data?.role == UserRole.creator) {
          ZHelperFunction.switchScreen(
            destination: Routes.creatorDashboardPage,
            replace: true,
          );
        } else {
          ZHelperFunction.switchScreen(
            destination: Routes.supporterDashboardPage,
            replace: true,
          );
        }
      },
    );
  }
}
