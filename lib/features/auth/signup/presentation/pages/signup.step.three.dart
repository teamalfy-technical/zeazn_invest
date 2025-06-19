import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/auth/signup/presentation/vm/signup.vm.dart';
import 'package:zeazn_invest_app/shared/shared.dart';
import 'package:zeazn_invest_app/shared/widgets/custom.button.right.dart';
import 'package:zeazn_invest_app/shared/widgets/custom.scaffold.dart';

class ZSignupStep3 extends StatelessWidget {
  ZSignupStep3({super.key});

  final ctrl = Get.find<ZSignupVm>();

  @override
  Widget build(BuildContext context) {
    zeaznLogger.e(ctrl.role.value);
    return ZCustomScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'enter_code_here'.tr,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(),
          ),
          ZAppSize.s20.verticalSpace,
          ZCustomPinput(
            onCompleted: (pin) {
              ctrl.updateOTP(pin);
              ctrl.verifyOTP(pin: pin, context: context, isSignup: true);
            },
          ),
          ZAppSize.s26.verticalSpace,
          Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              width: ZDeviceUtil.getDeviceWidth(context) * 0.39,
              child: ZCustomButtonRight(
                label: 'verify'.tr,
                onTap:
                    () => ctrl.verifyOTP(
                      pin: ctrl.otpcode.value,
                      context: context,
                      isSignup: true,
                    ),
                // ZHelperFunction.switchScreen(
                //   //destination: Routes.signupStep4,
                //   destination: Routes.progressStatePage,
                //   args: [
                //     false,
                //     ctrl.role.value == UserRole.creator
                //         ? Routes.signupStep4
                //         : Routes.signupStep12,
                //     'code_verified'.tr,
                //     ctrl.role.value,
                //   ],
                // ),
                backgroundColor: ZAppColor.primary,
                borderColor: ZAppColor.primary,
              ),
            ),
          ),
        ],
      ).scrollable().symmetric(horizontal: ZAppSize.s18),
    );
  }
}
