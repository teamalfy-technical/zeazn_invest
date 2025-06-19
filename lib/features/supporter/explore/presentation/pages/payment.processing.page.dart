import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/supporter/explore/presentation/vm/s.explore.vm.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';
import 'package:zeazn_invest_app/routes/app.pages.dart';
import 'package:zeazn_invest_app/shared/shared.dart';

class ZPaymentProcessingPage extends StatefulWidget {
  const ZPaymentProcessingPage({super.key});

  @override
  State<ZPaymentProcessingPage> createState() => _ZPaymentProcessingPageState();
}

class _ZPaymentProcessingPageState extends State<ZPaymentProcessingPage> {
  final ctrl = Get.find<ZSExploreVM>();

  Timer? _timer;
  int _tick = 0;

  String message = 'payment_processing_msg_1'.tr;

  @override
  void initState() {
    processPayment();
    super.initState();
  }

  processPayment() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _tick++;
      });
      if (_tick == 3) {
        message = 'payment_processing_msg_2'.tr;
      }
      if (_tick == 5) {
        message = 'payment_processing_msg_3'.tr;
      }
      if (_tick == 6) {
        _timer?.cancel();
        ZHelperFunction.switchScreen(destination: Routes.paymentSucessPage);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ZZeaznScaffold(
      backgroundColor: ZAppColor.offWhiteColor,
      logoPath: Assets.icons.logoDark.svg(height: ZAppSize.s55),
      child: SafeArea(
        top: true,
        bottom: false,
        left: false,
        right: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: ZAppSize.s16,
                horizontal: ZAppSize.s20,
              ),
              decoration: BoxDecoration(
                color: ZAppColor.blackColor,
                borderRadius: BorderRadius.circular(ZAppSize.s5),
              ),
              child: Column(
                crossAxisAlignment:
                    _tick == 5
                        ? CrossAxisAlignment.center
                        : CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Assets.icons.logoLight.svg(height: ZAppSize.s60),
                    // Image.asset(Assets.images.zeaznLogo.path),
                  ),

                  ZAppSize.s16.verticalSpace,

                  Text(
                    message,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: ZAppColor.hintTextColor,
                    ),
                  ),

                  ZAppSize.s1.verticalSpace,

                  Align(
                    alignment: Alignment.bottomRight,
                    child: Assets.icons.circleArrowIcon.svg(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
