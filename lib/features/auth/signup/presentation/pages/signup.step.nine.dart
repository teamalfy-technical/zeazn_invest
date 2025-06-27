import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/auth/signup/signup.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';
import 'package:zeazn_invest_app/routes/app.pages.dart';
import 'package:zeazn_invest_app/shared/shared.dart';

class ZSignupStep9 extends StatefulWidget {
  const ZSignupStep9({super.key});

  @override
  State<ZSignupStep9> createState() => _ZSignupStep9State();
}

class _ZSignupStep9State extends State<ZSignupStep9> {
  final ctrl = Get.find<ZSignupVm>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: false,
        left: false,
        right: false,
        child: Stack(
          children: [
            Positioned(
              bottom: ZDeviceUtil.getDeviceHeight(context) * 0.13,
              right: ZDeviceUtil.getDeviceWidth(context) * 0.1,
              child: Assets.icons.loveSmIcon.svg(),
            ),

            Positioned(
              bottom:
                  ZAppSize.s0, // ZDeviceUtil.getDeviceHeight(context) * 0.0,
              right: ZDeviceUtil.getDeviceWidth(context) * 0.1,
              left: ZDeviceUtil.getDeviceWidth(context) * 0.1,

              child: Image.asset(Assets.images.logoDark.path),

              //SvgPicture.asset('assets/icons/logo.dark.svg'),
            ),
            Positioned(
              top: ZDeviceUtil.getDeviceHeight(context) * 0.03,
              right: ZDeviceUtil.getDeviceWidth(context) * 0.01,
              left: ZDeviceUtil.getDeviceWidth(context) * 0.01,
              bottom: ZDeviceUtil.getDeviceHeight(context) * 0.18,
              child:
                  Column(
                    children: [
                      Text(
                        'id_checker'.tr.toUpperCase(),
                        textAlign: TextAlign.start,
                        style: Theme.of(
                          context,
                        ).textTheme.headlineMedium?.copyWith(
                          color: ZAppColor.whiteColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      ZAppSize.s10.verticalSpace,
                      Text(
                        'id_checker_desc'.tr,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: ZAppColor.whiteColor,

                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      ZAppSize.s26.verticalSpace,

                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'scanning_data'.tr,
                          textAlign: TextAlign.start,
                          style: Theme.of(
                            context,
                          ).textTheme.titleLarge?.copyWith(
                            color: ZAppColor.whiteColor,

                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                      ZAppSize.s10.verticalSpace,

                      IDScannerWidget(
                        identificationCard: ctrl.idFrontImage.value,
                      ),

                      // scanningDataWidget('Name: Sandra Smith'),

                      // ZAppSize.s13.verticalSpace,

                      // scanningDataWidget('DOB: 28.08.1977'),

                      // ZAppSize.s13.verticalSpace,

                      // scanningDataWidget('Sex: male'),

                      // ZAppSize.s13.verticalSpace,

                      // scanningDataWidget('Expires: 28.09.2027'),

                      // ZAppSize.s13.verticalSpace,

                      // scanningDataWidget('ID Type: Ghana card'),
                      // ZAppSize.s13.verticalSpace,

                      // Row(
                      //   children: [
                      //     Expanded(
                      //       child: scanningDataWidget(
                      //         'Pictures',
                      //         Alignment.center,
                      //       ),
                      //     ),
                      //     Expanded(child: Container()),
                      //   ],
                      // ),
                      ZAppSize.s16.verticalSpace,

                      // uploaded card images
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              width: ZDeviceUtil.getDeviceWidth(context),
                              height:
                                  ZDeviceUtil.getDeviceHeight(context) * 0.12,
                              decoration: BoxDecoration(
                                color: Color(0xFFd9d9d9),
                                borderRadius: BorderRadius.circular(
                                  ZAppSize.s5,
                                ),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: FileImage(ctrl.idFrontImage.value),
                                ),
                              ),
                            ),
                          ),
                          ZAppSize.s13.horizontalSpace,
                          Expanded(
                            child: Container(
                              width: ZDeviceUtil.getDeviceWidth(context),
                              height:
                                  ZDeviceUtil.getDeviceHeight(context) * 0.12,
                              decoration: BoxDecoration(
                                color: Color(0xFFd9d9d9),
                                borderRadius: BorderRadius.circular(
                                  ZAppSize.s5,
                                ),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: FileImage(ctrl.idBackImage.value),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      ZAppSize.s16.verticalSpace,

                      Obx(
                        () => Container(
                          width: ZDeviceUtil.getDeviceWidth(context),
                          height: ZDeviceUtil.getDeviceHeight(context) * 0.12,
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: ZAppColor.blackColor,
                            border: Border.all(color: ZAppColor.whiteColor),
                            borderRadius: BorderRadius.circular(ZAppSize.s5),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 35, // Adjust size
                                backgroundImage: AssetImage(
                                  Assets.images.slideFour.path,
                                ),
                              ),

                              ZAppSize.s16.horizontalSpace,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${ctrl.idName.value} ID no.',
                                      style:
                                          Theme.of(
                                            context,
                                          ).textTheme.titleLarge,
                                    ),
                                    Text(
                                      ctrl.idNumber.value.isEmpty
                                          ? ctrl.numberOnIdTEC.text
                                          : ctrl.idNumber.value,
                                      style:
                                          Theme.of(
                                            context,
                                          ).textTheme.titleLarge,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      ZAppSize.s26.verticalSpace,
                    ],
                  ).scrollable(),
            ),

            Positioned(
              bottom: ZDeviceUtil.getDeviceHeight(context) * 0.1,
              right: ZAppSize.s0,
              child: SizedBox(
                width: ZDeviceUtil.getDeviceWidth(context) * 0.55,
                child: ZCustomButton(
                  label: 'submit'.tr,
                  radius: ZAppSize.s5,
                  icon: Assets.icons.arrowRectDiag.svg(height: ZAppSize.s32),
                  onTap:
                      () =>
                      //ctrl.submitKYC(context: context),
                      ZHelperFunction.switchScreen(
                        destination: Routes.progressStatePage,
                        args: [
                          true,
                          Routes.signupStep10,
                          'verifying_docs_msg'.tr,
                          ctrl.role.value,
                        ],
                      ),
                ),
              ),
            ),
          ],
        ).symmetric(horizontal: ZAppSize.s24),
      ),
      // floatingActionButton: SizedBox(
      //   width: ZDeviceUtil.getDeviceWidth(context) * 0.55,
      //   child: ZCustomButton(
      //     label: 'submit'.tr,
      //     radius: ZAppSize.s5,
      //     icon: Assets.icons.arrowRectDiag.svg(height: ZAppSize.s32),
      //     onTap: () {},
      //   ),
      // ),
    );
  }
}
