import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/auth/login/presentation/vm/login.vm.dart';
import 'package:zeazn_invest_app/features/auth/signup/presentation/vm/signup.vm.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';
import 'package:zeazn_invest_app/routes/app.pages.dart';
import 'package:zeazn_invest_app/shared/shared.dart';
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
                validator: ZValidator.validateEmail,
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
              ZAppSize.s60.verticalSpace,
              ZAuthLinkButton(
                title: '${'dont_have_account'.tr} ',
                subtitle: 'sign_up'.tr,
                subtitleColor: ZAppColor.primary,
                onTap: () => showUserTypeModal(context),
              ),
            ],
          ).scrollable().symmetric(horizontal: ZAppSize.s18),
        ),
      ),
    );
  }

  Future showUserTypeModal(BuildContext context) {
    return showCustomBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(ZAppSize.s16),
          topRight: Radius.circular(ZAppSize.s16),
        ),
      ),
      child: Container(
        height: ZDeviceUtil.getDeviceHeight(context) * 0.25,
        padding: EdgeInsets.symmetric(horizontal: ZAppSize.s28),
        // decoration: BoxDecoration(
        //   color: ZAppColor.blackColor,
        //   borderRadius: BorderRadius.only(
        //     topLeft: Radius.circular(ZAppSize.s10),
        //     topRight: Radius.circular(ZAppSize.s10),
        //   ),
        // ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.find<ZSignupVm>().setRole(UserRole.creator);
                ZHelperFunction.switchScreen(destination: Routes.signupStep1);
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(ZAppSize.s32),
                ),
              ),
              child: Text(
                'continue_as_creator'.tr,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            ZAppSize.s20.verticalSpace,
            SizedBox(
              width: ZDeviceUtil.getDeviceWidth(context),
              child: OutlinedButton(
                onPressed: () {
                  Get.find<ZSignupVm>().setRole(UserRole.investor);
                  ZHelperFunction.switchScreen(destination: Routes.signupStep1);
                },
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(ZAppSize.s32),
                  ),
                ),
                child: Text(
                  'continue_as_investor'.tr,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: ZAppColor.primary),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
