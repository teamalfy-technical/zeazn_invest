import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/auth/signup/presentation/vm/signup.vm.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';
import 'package:zeazn_invest_app/shared/widgets/custom.scaffold.dart';

class ZCompleteStatePage extends StatelessWidget {
  final bool replace;
  final String nextRoute;
  final String message;

  ZCompleteStatePage({
    super.key,
    this.replace = false,

    required this.nextRoute,
    required this.message,
  });

  final ctrl = Get.find<ZSignupVm>();

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 3000), () {
      ZHelperFunction.switchScreen(destination: nextRoute, replace: replace);
    });
    return ZCustomScaffold(
      top: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Assets.icons.logoLight.svg(),
            //Image.asset(Assets.images.logoLight.path),
          ),
          ZAppSize.s20.verticalSpace,
          Align(
            alignment: Alignment.center,
            child: Text(
              message,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: ZAppColor.hintTextColor,
              ),
            ),
          ),
          ZAppSize.s20.verticalSpace,
          Assets.icons.checkIcon.svg(),
          ZAppSize.s20.verticalSpace,
          Align(
            alignment: Alignment.bottomRight,
            child: Assets.icons.circleArrowIcon.svg(),
          ),
        ],
      ).symmetric(horizontal: ZAppSize.s28),
    );
  }
}
