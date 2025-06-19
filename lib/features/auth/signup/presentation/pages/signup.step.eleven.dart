import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/auth/signup/presentation/vm/signup.vm.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';
import 'package:zeazn_invest_app/routes/app.pages.dart';
import 'package:zeazn_invest_app/shared/shared.dart';

class ZSignupStep11 extends StatefulWidget {
  const ZSignupStep11({super.key});

  @override
  State<ZSignupStep11> createState() => _ZSignupStep11State();
}

class _ZSignupStep11State extends State<ZSignupStep11> {
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
                        'country_and_location'.tr,
                        textAlign: TextAlign.start,
                        style: Theme.of(
                          context,
                        ).textTheme.headlineMedium?.copyWith(
                          color: ZAppColor.whiteColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      ZAppSize.s10.verticalSpace,
                      Text(
                        'country_and_location_desc'.tr,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: ZAppColor.whiteColor,

                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      ZAppSize.s26.verticalSpace,

                      // scanningDataWidget(
                      //   'country'.tr,
                      //   Assets.icons.globeIcon.svg(),
                      //   Assets.icons.arrowDownIos.svg(),
                      // ),
                      scanningDataWidget(
                        leadingIcon: Assets.icons.globeIcon.svg(
                          fit: BoxFit.contain,
                          width: ZAppSize.s24,
                          height: ZAppSize.s24,
                        ),
                        content: CountryCodePicker(
                          key: ctrl.countryPickerKey,
                          onChanged: ctrl.onCountryChange,
                          // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                          initialSelection: ctrl.mySelectedCountry.code,
                          favorite: ['+233', 'GH'],
                          // optional. Shows only country name and flag
                          showCountryOnly: true,

                          showFlag: false,
                          // optional. Shows only country name and flag when popup is closed.
                          showOnlyCountryWhenClosed: true,
                          // headerAlignment: MainAxisAlignment.spaceBetween,
                          // optional. aligns the flag and the Text left
                          alignLeft: true,
                          padding: EdgeInsets.zero,
                          margin: EdgeInsets.zero,

                          showDropDownButton: false,
                          dialogBackgroundColor: ZAppColor.darkFillColor,
                          textStyle: Theme.of(context).textTheme.bodyMedium,
                          boxDecoration: BoxDecoration(
                            color: ZAppColor.darkFillColor,
                            borderRadius: BorderRadius.circular(ZAppSize.s8),
                          ),
                        ),
                        trailingIcon: Assets.icons.arrowDownIos
                            .svg(
                              fit: BoxFit.contain,
                              width: ZAppSize.s24,
                              height: ZAppSize.s24,
                            )
                            .onPressed(
                              onTap:
                                  () =>
                                      ctrl.countryPickerKey.currentState
                                          ?.showCountryCodePickerDialog(),
                            ),
                      ),

                      ZAppSize.s16.verticalSpace,

                      TextField(
                        decoration: InputDecoration(
                          prefixIcon: Transform.scale(
                            scale: ZAppSize.s0_6_5,
                            child: Assets.icons.locationPinIcon.svg(
                              fit: BoxFit.contain,
                              width: ZAppSize.s4,
                              height: ZAppSize.s4,
                            ),
                          ),
                          hintText: 'search_here'.tr,
                          fillColor: ZAppColor.darkFillColor,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(ZAppSize.s5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(ZAppSize.s5),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(ZAppSize.s5),
                          ),
                        ),
                      ),

                      ZAppSize.s16.verticalSpace,

                      Image.asset(Assets.images.mapImg.path),

                      // scanningDataWidget('DOB: 28.08.1977'),
                      ZAppSize.s13.verticalSpace,
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
                      () => ZHelperFunction.switchScreen(
                        destination: Routes.signupStep12,
                        args: ctrl.role.value,
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

  Widget scanningDataWidget({
    required Widget content,
    Widget? leadingIcon,
    Widget? trailingIcon,
    Alignment alignament = Alignment.centerLeft,
  }) {
    return Container(
      alignment: alignament,
      width: double.infinity,
      height: ZAppSize.s48,
      padding: EdgeInsets.symmetric(horizontal: ZAppSize.s15),
      decoration: BoxDecoration(
        color: ZAppColor.darkFillColor,
        borderRadius: BorderRadius.circular(ZAppSize.s5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                leadingIcon ?? SizedBox.shrink(),

                Expanded(child: content),
              ],
            ),
          ),
          trailingIcon ?? SizedBox.shrink(),
        ],
      ),
    );
  }
}
