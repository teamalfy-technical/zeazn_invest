import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/auth/signup/presentation/vm/signup.vm.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';
import 'package:zeazn_invest_app/routes/app.pages.dart';
import 'package:zeazn_invest_app/shared/widgets/custom.button.right.dart';

class ZSignupStep7 extends StatefulWidget {
  const ZSignupStep7({super.key});

  @override
  State<ZSignupStep7> createState() => _ZSignupStep7State();
}

class _ZSignupStep7State extends State<ZSignupStep7> {
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
            Expanded(
              child:
                  Column(
                    children: [
                      Text(
                        'upload_id'.tr.toUpperCase(),
                        textAlign: TextAlign.start,
                        style: Theme.of(
                          context,
                        ).textTheme.headlineMedium?.copyWith(
                          color: ZAppColor.whiteColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      ZAppSize.s26.verticalSpace,
                      Text(
                        'scan_front_id'.tr,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: ZAppColor.whiteColor,

                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      ZAppSize.s24.verticalSpace,

                      Container(
                        width: ZDeviceUtil.getDeviceWidth(context),
                        height: ZDeviceUtil.getDeviceHeight(context) / 2,
                        decoration: BoxDecoration(
                          color: Color(0xFFd9d9d9),
                          borderRadius: BorderRadius.circular(ZAppSize.s10),
                        ),
                      ),

                      ZAppSize.s20.verticalSpace,

                      Text(
                        'upload_from_gallery'.tr.toUpperCase(),
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: ZAppColor.whiteColor,

                          fontWeight: FontWeight.w500,
                        ),
                      ).onPressed(onTap: ctrl.chooseFromGallery),

                      ZAppSize.s20.verticalSpace,
                      Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          width: ZDeviceUtil.getDeviceWidth(context) * 0.36,
                          child: ZCustomButtonRight(
                            label: 'scan'.tr.toUpperCase(),
                            onTap:
                                () => ZHelperFunction.switchScreen(
                                  destination: Routes.completeStatePage,
                                  args: [
                                    true,
                                    Routes.signupStep8,
                                    'upload_successful'.tr,
                                  ],
                                ),
                            backgroundColor: ZAppColor.primary,
                            borderColor: ZAppColor.primary,
                          ),
                        ),
                      ),

                      ZAppSize.s26.verticalSpace,
                    ],
                  ).scrollable(),
            ),

            Image.asset(Assets.images.logoDark.path),

            ZAppSize.s16.verticalSpace,
          ],
        ).symmetric(horizontal: ZAppSize.s24),
      ),
    );
  }
}
