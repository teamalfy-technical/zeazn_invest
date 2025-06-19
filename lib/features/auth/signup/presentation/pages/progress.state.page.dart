import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/auth/signup/presentation/vm/signup.vm.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';
import 'package:zeazn_invest_app/routes/app.pages.dart';
import 'package:zeazn_invest_app/shared/widgets/custom.scaffold.dart';

class ZProgressStatePage extends StatefulWidget {
  final bool replace;
  final String nextRoute;
  final String message;

  const ZProgressStatePage({
    super.key,
    this.replace = false,
    required this.message,
    required this.nextRoute,
  });

  @override
  State<ZProgressStatePage> createState() => _ZProgressStatePageState();
}

class _ZProgressStatePageState extends State<ZProgressStatePage> {
  final ctrl = Get.find<ZSignupVm>();

  late String message;

  @override
  void initState() {
    super.initState();
    message = widget.message;

    if (Get.previousRoute == Routes.signupStep3) {
      Future.delayed(Duration(milliseconds: ZAppSize.s1000), () {
        setState(() {
          message =
              ctrl.role.value == UserRole.creator
                  ? 'few_more_details_msg'.tr
                  : 'just_one_step_msg'.tr;
        });
      });
    }
    Future.delayed(Duration(milliseconds: ZAppSize.s2000), () {
      ZHelperFunction.switchScreen(
        destination: widget.nextRoute,
        replace: widget.replace,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return ZCustomScaffold(
      top: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Assets.icons.logoLight.svg(height: ZAppSize.s80),
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
          Align(
            alignment: Alignment.bottomRight,
            child: Assets.icons.circleArrowIcon.svg(),
          ),
        ],
      ).symmetric(horizontal: ZAppSize.s28),
    );
  }
}
