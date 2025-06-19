import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/auth/signup/presentation/vm/signup.vm.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';
import 'package:zeazn_invest_app/shared/shared.dart';
import 'package:zeazn_invest_app/shared/widgets/custom.button.right.dart';
import 'package:zeazn_invest_app/shared/widgets/custom.scaffold.dart';

class ZSignupStep12 extends StatelessWidget {
  final UserRole role;
  ZSignupStep12({super.key, required this.role});

  final ctrl = Get.find<ZSignupVm>();

  @override
  Widget build(BuildContext context) {
    return ZCustomScaffold(
      child: Obx(
        () => Form(
          key: ctrl.addPasswordFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'create_password'.tr,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(),
              ),
              Text(
                '(${'promise_not_to_share'.tr})',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
              ZAppSize.s38.verticalSpace,
              ZCustomPasswordTextField(
                labelText: 'password'.tr,
                hintText: '',
                prefixIcon: null,
                suffixIcon: Assets.icons.eyeIcon.path,
                obscure: ctrl.obscure.value,
                onObscureChanged: ctrl.onObscureChanged,
                controller: ctrl.passwordTEC,
              ),
              ZAppSize.s24.verticalSpace,
              ZCustomPasswordTextField(
                labelText: 'confirm_password'.tr,
                hintText: '',
                prefixIcon: null,
                suffixIcon: Assets.icons.eyeIcon.path,
                obscure: ctrl.obscure.value,
                onObscureChanged: ctrl.onObscureChanged,
                controller: ctrl.confirmPasswordTEC,
              ),
              ZAppSize.s24.verticalSpace,
              Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                  width: ZDeviceUtil.getDeviceWidth(context) * 0.39,
                  child: ZCustomButtonRight(
                    label: 'verify'.tr,
                    onTap: () {
                      if (ctrl.addPasswordFormKey.currentState!.validate()) {
                        ZDeviceUtil.hideKeyboard(context);
                        ctrl.addPassword(context: context);
                        // ZHelperFunction.switchScreen(
                        //   destination: Routes.progressStatePage,
                        //   args: [
                        //     true,
                        //     Routes.loginPage,
                        //     'signing_up_msg'.tr,
                        //     role,
                        //   ],
                        // );
                      }
                    },
                    backgroundColor: ZAppColor.primary,
                    borderColor: ZAppColor.primary,
                  ),
                ),
              ),
            ],
          ).scrollable().symmetric(horizontal: ZAppSize.s18),
        ),
      ),
    );
  }
}
