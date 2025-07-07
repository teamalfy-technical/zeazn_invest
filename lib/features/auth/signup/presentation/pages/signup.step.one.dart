import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/auth/signup/presentation/vm/signup.vm.dart';
import 'package:zeazn_invest_app/routes/app.pages.dart';
import 'package:zeazn_invest_app/shared/shared.dart';
import 'package:zeazn_invest_app/shared/widgets/custom.phone.textfield.dart';
import 'package:zeazn_invest_app/shared/widgets/custom.scaffold.dart';

class ZSignupStep1 extends StatelessWidget {
  ZSignupStep1({super.key});

  final ctrl = Get.find<ZSignupVm>();

  @override
  Widget build(BuildContext context) {
    return ZCustomScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'verify_email_title'.tr,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(),
          ),
          Text(
            '(${'promise_not_to_share'.tr})',
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w400),
          ),
          ZAppSize.s24.verticalSpace,
          ZCustomTextField(
            labelText: 'name'.tr,
            hintText: 'hint_fullname'.tr,
            prefixIcon: null,
            controller: ctrl.nameTEC,
          ),
          ZAppSize.s16.verticalSpace,
          ZCustomPhoneTextfield(
            ctrl: ctrl,
            labelText: 'phone_number'.tr,
            // hintText: 'hint_phone_number'.tr,
            // prefixIcon: null,
            // controller: ctrl.nameTEC,
          ),
          ZAppSize.s16.verticalSpace,
          ZCustomTextField(
            labelText: 'email_address'.tr,
            hintText: 'hint_email_address'.tr,
            prefixIcon: null,
            controller: ctrl.emailTEC,
          ),
          ZAppSize.s26.verticalSpace,
          Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              width: ZDeviceUtil.getDeviceWidth(context) * 0.39,
              child: ZCustomButtonRight(
                label: 'verify'.tr,
                onTap: () {
                  ctrl.signup(context: context);
                },
                backgroundColor: ZAppColor.primary,
                borderColor: ZAppColor.primary,
              ),
            ),
          ),
          ZAppSize.s60.verticalSpace,
          ZAuthLinkButton(
            title: '${'already_have_account'.tr} ',
            subtitle: 'sign_in'.tr,
            subtitleColor: ZAppColor.primary,
            onTap:
                () =>
                    ZHelperFunction.switchScreen(destination: Routes.loginPage),
          ),

          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: ZAuthLinkButton(
          //     title: '${'already_have_account'.tr} ',
          //     subtitle: 'sign_in'.tr,
          //     subtitleColor: ZAppColor.primary,
          //     onTap:
          //         () => ZHelperFunction.switchScreen(
          //           destination: Routes.loginPage,
          //         ),
          //   ),
          // ),
        ],
      ).scrollable().symmetric(horizontal: ZAppSize.s18),
    );
  }
}
