import 'dart:async';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/supporter/explore/presentation/vm/s.explore.vm.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';
import 'package:zeazn_invest_app/routes/app.pages.dart';
import 'package:zeazn_invest_app/shared/shared.dart';

class ZPaymentSuccessPage extends StatefulWidget {
  const ZPaymentSuccessPage({super.key});

  @override
  State<ZPaymentSuccessPage> createState() => _ZPaymentSuccessPageState();
}

class _ZPaymentSuccessPageState extends State<ZPaymentSuccessPage> {
  final ctrl = Get.put(ZSExploreVM());

  late ConfettiController _controllerCenter;

  Timer? _timer;

  @override
  void initState() {
    //processPayment();
    _controllerCenter = ConfettiController(
      duration: const Duration(seconds: 2),
    );
    _controllerCenter.play();

    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      ZHelperFunction.switchScreen(
        destination: Routes.supporterDashboardPage,
        replace: true,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    _controllerCenter.dispose();
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
        child: Stack(
          children: [
            Positioned.fill(
              top: ZAppSize.s50,
              child: Image.asset(
                Assets.images.happyInvestor.path,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: ZDeviceUtil.getDeviceHeight(context) * 0.17,
              left: ZDeviceUtil.getDeviceWidth(context) * 0.05,
              right: ZDeviceUtil.getDeviceWidth(context) * 0.05,
              child: Text(
                'payment_success_msg'.tr,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: ZAppColor.whiteColor,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: ConfettiWidget(
                confettiController: _controllerCenter,
                blastDirectionality: BlastDirectionality.explosive,
                shouldLoop: false,
                colors: const [
                  ZAppColor.offWhiteColor,
                  ZAppColor.primaryDark,
                  Colors.blue,
                  ZAppColor.errorColor,
                  ZAppColor.blackColor,
                ],
                emissionFrequency: 0.05,
                numberOfParticles: 20,
                gravity: 0.3,
              ),
            ),
          ],
        ).onPressed(
          onTap: () {
            ctrl.setSupportType(SupportType.one);
            ZHelperFunction.switchScreen(
              destination: Routes.supporterDashboardPage,
              replace: true,
            );
          },
        ),
      ),
    );
  }
}
