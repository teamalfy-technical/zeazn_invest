import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/auth/signup/presentation/widgets/verification.method.widget.dart';
import 'package:zeazn_invest_app/features/supporter/explore/presentation/vm/s.explore.vm.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';
import 'package:zeazn_invest_app/routes/app.pages.dart';
import 'package:zeazn_invest_app/shared/widgets/custom.button.right.dart';

class ZPaymentMethodPage extends StatefulWidget {
  const ZPaymentMethodPage({super.key});

  @override
  State<ZPaymentMethodPage> createState() => _ZPaymentMethodPageState();
}

class _ZPaymentMethodPageState extends State<ZPaymentMethodPage> {
  final ctrl = Get.find<ZSExploreVM>();

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
              'pay_with'.tr,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: ZAppColor.whiteColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            ZAppSize.s26.verticalSpace,
            Text(
              'choose_pyament_method'.tr,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: ZAppColor.whiteColor,

                fontWeight: FontWeight.w500,
              ),
            ),

            ZAppSize.s24.verticalSpace,

            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: ctrl.paymentMethods.length,
                itemBuilder: (context, index) {
                  return Obx(
                    () => ZVerificationMethodWidget(
                      label: ctrl.paymentMethods[index],
                      title: 'payment'.tr,
                      index: index,
                      isSelected: ctrl.selectedPMIndex.value == index,
                      onTap: () {
                        ctrl.onSelectedPaymentMethod(index);
                      },
                    ),
                  );
                },
              ),
            ),

            ZAppSize.s14.verticalSpace,
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: ZDeviceUtil.getDeviceWidth(context) * 0.40,
                child: ZCustomButtonRight(
                  label: 'next'.tr.toUpperCase(),
                  onTap:
                      () => ZHelperFunction.switchScreen(
                        destination: Routes.chooseCardPage,
                        // args: project
                      ),
                  backgroundColor: ZAppColor.primary,
                  borderColor: ZAppColor.primary,
                ),
              ),
            ),

            ZAppSize.s16.verticalSpace,

            // Spacer(),
            Image.asset(Assets.images.logoDark.path),

            ZAppSize.s16.verticalSpace,
          ],
        ).symmetric(horizontal: ZAppSize.s22),
      ),
    );
  }
}
