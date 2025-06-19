import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/auth/login/presentation/vm/login.vm.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';
import 'package:zeazn_invest_app/shared/shared.dart';
import 'package:zeazn_invest_app/shared/widgets/custom.button.right.dart';
import 'package:zeazn_invest_app/shared/widgets/custom.scaffold.dart';

class ZLoginPage extends StatelessWidget {
  ZLoginPage({super.key});

  final ctrl = Get.put(ZLoginVm());

  @override
  Widget build(BuildContext context) {
    return ZCustomScaffold(
      child: Obx(
        () => Form(
          key: ctrl.loginFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'welcome_back'.tr,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(),
              ),
              Text(
                'sign_in'.tr,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
              ZAppSize.s38.verticalSpace,

              ZCustomTextField(
                labelText: 'email_address'.tr,
                hintText: 'hint_email_address'.tr,
                prefixIcon: null,
                controller: ctrl.emailTEC,
              ),
              ZAppSize.s24.verticalSpace,
              ZCustomPasswordTextField(
                labelText: 'password'.tr,
                hintText: 'hint_password'.tr,
                prefixIcon: null,
                suffixIcon: Assets.icons.eyeIcon.path,
                obscure: ctrl.obscure.value,
                onObscureChanged: ctrl.onObscureChanged,
                controller: ctrl.passwordTEC,
              ),
              ZAppSize.s24.verticalSpace,
              Align(
                alignment: Alignment.bottomRight,
                child: ZCustomButtonRight(
                  label: 'sign_in'.tr,
                  onTap: () {
                    if (ctrl.loginFormKey.currentState!.validate()) {
                      ctrl.login();
                    }
                  },
                  backgroundColor: ZAppColor.primary,
                  borderColor: ZAppColor.primary,
                ),
              ),
            ],
          ).scrollable().symmetric(horizontal: ZAppSize.s18),
        ),
      ),
    );
  }
}
