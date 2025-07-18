import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/auth/signup/presentation/vm/signup.vm.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';
import 'package:zeazn_invest_app/routes/app.pages.dart';
import 'package:zeazn_invest_app/shared/shared.dart';

class ZSignupStep10 extends StatefulWidget {
  const ZSignupStep10({super.key});

  @override
  State<ZSignupStep10> createState() => _ZSignupStep10State();
}

class _ZSignupStep10State extends State<ZSignupStep10> {
  final ctrl = Get.find<ZSignupVm>();

  double _scanDuration = 0.0;

  Timer? _timer;

  @override
  void initState() {
    // startScanTimer();
    super.initState();
  }

  startScanTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_scanDuration < 1.0) {
          _scanDuration += 0.1; // Increase progress by 0.1 every second
        } else {
          _timer?.cancel(); // Stop the timer when the progress reaches 100%
        }
      });
      zeaznLogger.e(_scanDuration);
      if (_scanDuration >= 1.0) {
        Future.delayed(Duration(milliseconds: 2000), () {
          ZHelperFunction.switchScreen(destination: Routes.signupStep11);
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer == null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: false,
        left: false,
        right: false,
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ZAppSize.s20.verticalSpace,
              Expanded(
                child:
                    Column(
                      children: [
                        Text(
                          'face_id'.tr,
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
                          'face_id_desc'.tr,
                          textAlign: TextAlign.center,
                          style: Theme.of(
                            context,
                          ).textTheme.titleLarge?.copyWith(
                            color: ZAppColor.whiteColor,

                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        ZAppSize.s24.verticalSpace,

                        ctrl.selfieImage.value.path.isNotEmpty
                            ? Container(
                              width: ZDeviceUtil.getDeviceWidth(context),
                              height: ZDeviceUtil.getDeviceHeight(context) / 3,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFd9d9d9),
                                // borderRadius: BorderRadius.circular(
                                //   ZAppSize.s10,
                                // ),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: FileImage(ctrl.selfieImage.value),
                                ),
                              ),
                            )
                            : Container(
                              width: ZDeviceUtil.getDeviceWidth(context),
                              height: ZDeviceUtil.getDeviceHeight(context) / 4,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFd9d9d9),
                                // borderRadius: BorderRadius.circular(
                                //   ZAppSize.s180,
                                // ),
                              ),
                            ),

                        ZAppSize.s20.verticalSpace,

                        Text(
                          'upload_from_gallery'.tr.toUpperCase(),
                          textAlign: TextAlign.start,
                          style: Theme.of(
                            context,
                          ).textTheme.titleLarge?.copyWith(
                            color: ZAppColor.whiteColor,

                            fontWeight: FontWeight.w500,
                          ),
                        ).onPressed(
                          onTap:
                              () => ctrl.chooseFromGallery(
                                kycType: KycType.selfie,
                              ),
                        ),

                        ZAppSize.s20.verticalSpace,
                        Align(
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                            width: ZDeviceUtil.getDeviceWidth(context) * 0.52,
                            child: ZCustomButtonRight(
                              label:
                                  ctrl.selfieImage.value.path.isNotEmpty
                                      ? 'next'.tr.toUpperCase()
                                      : 'take_selfie'.tr.toUpperCase(),
                              onTap: () {
                                if (ctrl.selfieImage.value.path.isEmpty) {
                                  ctrl.takePhoto(kycType: KycType.selfie);
                                } else {
                                  ZHelperFunction.switchScreen(
                                    destination: Routes.signupStep11,
                                  );
                                  // ZHelperFunction.switchScreen(
                                  //   destination: Routes.completeStatePage,
                                  //   args: [
                                  //     true,
                                  //     Routes.signupStep8,
                                  //     'upload_successful'.tr,
                                  //   ],
                                  // );
                                }
                              },
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
      ),
    );

    // return Scaffold(
    //   body: SafeArea(
    //     top: true,
    //     bottom: false,
    //     left: false,
    //     right: false,
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         // ZAppSize.s20.verticalSpace,
    //         Expanded(
    //           child:
    //               Column(
    //                 children: [
    //                   ZAppSize.s20.verticalSpace,
    //                   Text(
    //                     _scanDuration < 1.0 ? 'face_id'.tr : 'successful'.tr,
    //                     textAlign: TextAlign.start,
    //                     style: Theme.of(
    //                       context,
    //                     ).textTheme.headlineMedium?.copyWith(
    //                       color: ZAppColor.whiteColor,
    //                       fontWeight: FontWeight.w500,
    //                     ),
    //                   ),
    //                   ZAppSize.s26.verticalSpace,
    //                   Text(
    //                     _scanDuration < 1.0
    //                         ? 'face_id_desc'.tr
    //                         : 'id_confirmed'.tr,
    //                     textAlign: TextAlign.center,
    //                     style: Theme.of(context).textTheme.titleLarge?.copyWith(
    //                       height: 1.6,
    //                       color: ZAppColor.whiteColor,

    //                       fontWeight: FontWeight.w500,
    //                     ),
    //                   ),

    //                   ZAppSize.s24.verticalSpace,

    //                   Container(
    //                     width: ZDeviceUtil.getDeviceWidth(context),
    //                     height: ZDeviceUtil.getDeviceHeight(context) / 2,
    //                     decoration: BoxDecoration(
    //                       image: DecorationImage(
    //                         fit: BoxFit.cover,
    //                         image: AssetImage(Assets.images.faceIdImg.path),
    //                       ),
    //                     ),
    //                   ),

    //                   ZAppSize.s16.verticalSpace,

    //                   Text(
    //                     '${(_scanDuration * 100).toStringAsFixed(0)}%',
    //                     textAlign: TextAlign.start,
    //                     style: Theme.of(context).textTheme.bodyMedium?.copyWith(
    //                       color: ZAppColor.whiteColor,
    //                       fontWeight: FontWeight.w500,
    //                     ),
    //                   ),

    //                   ZAppSize.s6.verticalSpace,

    //                   LinearProgressIndicator(
    //                     minHeight: ZAppSize.s15,
    //                     borderRadius: BorderRadius.circular(ZAppSize.s12),
    //                     value: _scanDuration,
    //                     backgroundColor: ZAppColor.primary.withOpacityExt(
    //                       ZAppSize.s0_2,
    //                     ),
    //                     valueColor: AlwaysStoppedAnimation(ZAppColor.primary),
    //                   ).symmetric(horizontal: ZAppSize.s24),

    //                   ZAppSize.s6.verticalSpace,

    //                   if (_scanDuration < 1.0)
    //                     Text(
    //                       'scanning'.tr,
    //                       textAlign: TextAlign.start,
    //                       style: Theme.of(
    //                         context,
    //                       ).textTheme.bodyMedium?.copyWith(
    //                         color: ZAppColor.whiteColor,
    //                         fontWeight: FontWeight.w500,
    //                       ),
    //                     ),

    //                   ZAppSize.s26.verticalSpace,
    //                 ],
    //               ).scrollable(),
    //         ),

    //         Image.asset(Assets.images.logoDark.path),

    //         ZAppSize.s16.verticalSpace,
    //       ],
    //     ),
    //   ),
    // );
  }
}
