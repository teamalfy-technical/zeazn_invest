import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/auth/signup/presentation/vm/signup.vm.dart';
import 'package:zeazn_invest_app/features/auth/signup/presentation/widgets/verification.method.widget.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';
import 'package:zeazn_invest_app/routes/app.pages.dart';
import 'package:zeazn_invest_app/shared/widgets/custom.button.right.dart';

class ZSignupStep6 extends StatefulWidget {
  const ZSignupStep6({super.key});

  @override
  State<ZSignupStep6> createState() => _ZSignupStep6State();
}

class _ZSignupStep6State extends State<ZSignupStep6> {
  final ctrl = Get.find<ZSignupVm>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: false,
        left: false,
        right: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ZAppSize.s20.verticalSpace,
            Text(
              'security_compliance_title'.tr,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: ZAppColor.whiteColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            ZAppSize.s26.verticalSpace,
            Text(
              'choose_verification_method'.tr,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: ZAppColor.whiteColor,

                fontWeight: FontWeight.w500,
              ),
            ),

            ZAppSize.s24.verticalSpace,

            ListView.builder(
              shrinkWrap: true,
              itemCount: ctrl.verificationMethods.length,
              itemBuilder: (context, index) {
                return Obx(
                  () => ZVerificationMethodWidget(
                    label: ctrl.verificationMethods[index],
                    index: index,
                    isSelected: ctrl.selectedIndex.value == index,
                    onTap: () {
                      ctrl.onSelectedVerificationMethod(index);
                    },
                  ),
                );
              },
            ),

            ZAppSize.s14.verticalSpace,
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: ZDeviceUtil.getDeviceWidth(context) * 0.36,
                child: ZCustomButtonRight(
                  label: 'next'.tr.toUpperCase(),
                  onTap:
                      () => ZHelperFunction.switchScreen(
                        destination: Routes.signupStep7,
                      ),
                  backgroundColor: ZAppColor.primary,
                  borderColor: ZAppColor.primary,
                ),
              ),
            ),

            ZAppSize.s26.verticalSpace,

            Spacer(),

            Image.asset(Assets.images.logoDark.path),

            ZAppSize.s16.verticalSpace,
          ],
        ).symmetric(horizontal: ZAppSize.s22),
      ),
    );
  }
}
