import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/auth/signup/presentation/vm/signup.vm.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';
import 'package:zeazn_invest_app/routes/app.pages.dart';
import 'package:zeazn_invest_app/shared/widgets/custom.scaffold.dart';

class ZSignupStep2 extends StatelessWidget {
  ZSignupStep2({super.key});

  final ctrl = Get.find<ZSignupVm>();

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 3000), () {
      ZHelperFunction.switchScreen(destination: Routes.signupStep3);
    });
    return ZCustomScaffold(
      top: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'we_sent_code_msg'.tr,
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.headlineLarge?.copyWith(color: ZAppColor.hintTextColor),
          ),
          ZAppSize.s20.verticalSpace,
          Assets.icons.sendIcon.svg(),
        ],
      ).symmetric(horizontal: ZAppSize.s18),
    );
  }
}
