import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/creator/explore/explore.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';
import 'package:zeazn_invest_app/routes/app.pages.dart';
import 'package:zeazn_invest_app/shared/shared.dart';
import 'package:zeazn_invest_app/shared/widgets/custom.container.dart';

class ZExclusiveExperiencesPage extends StatelessWidget {
  ZExclusiveExperiencesPage({super.key});
  final ctrl = Get.find<ZCreateProjectVM>();

  @override
  Widget build(BuildContext context) {
    return ZZeaznScaffold(
      backgroundColor: ZAppColor.darkColor,
      resizeToAvoidBottomInset: false,
      child: Column(
        children: [
          ZAppSize.s20.verticalSpace,
          Text(
            'exclusive_experiences'.tr,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(),
          ),
          ZAppSize.s5.verticalSpace,
          Text(
            'exclusive_experiences_desc'.tr,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
          ),
          ZAppSize.s20.verticalSpace,
          Expanded(child: planWidget(context, ctrl)),
          // Expanded(
          //   child: GetBuilder<ZExploreVM>(
          //     builder: (controller) {
          //       return ListView.builder(
          //         itemCount: ctrl.plans.length,
          //         itemBuilder: (context, index) {
          //           return planWidget(context, ctrl.plans[index], index);
          //         },
          //       );
          //     },
          //   ),

          // ),
          ZAppSize.s24.verticalSpace,
          Row(
            children: [
              Expanded(
                child: Text(
                  'skip'.tr,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: ZAppColor.primary,
                  ),
                ).onPressed(
                  onTap:
                      () => ZHelperFunction.switchScreen(
                        destination: Routes.progressStatePage,
                        args: [
                          true,
                          Routes.creatorDashboardPage,
                          'creating_project_msg'.tr,
                          null,
                        ],
                      ),
                ),
              ),
              Expanded(
                child: ZCustomButton(
                  label: 'next'.tr,
                  radius: ZAppSize.s5,
                  loading: ctrl.loading.value,
                  onTap: () {
                    showDisclaimerDialog(context);
                  },
                  // () => ZHelperFunction.switchScreen(
                  //   destination: Routes.progressStatePage,
                  //   args: [
                  //     true,
                  //     Routes.creatorDashboardPage,
                  //     'creating_project_msg'.tr,
                  //   ],
                  // ),
                ),
              ),
            ],
          ),
          ZAppSize.s24.verticalSpace,
        ],
      ),
    );
  }

  Future showDisclaimerDialog(BuildContext context) {
    return showAdaptiveDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor:
              ZHelperFunction.isDarkMode(context)
                  ? ZAppColor.whiteColor
                  : ZAppColor.lightBlackColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ZAppSize.s10),
          ),
          title: Text(
            'Dear Creator',
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(color: ZAppColor.blackColor),
          ),
          content: SizedBox(
            height: ZDeviceUtil.getDeviceHeight(context) * 0.45,
            child:
                Column(
                  children: [
                    RichText(
                      // textAlign: TextAlign.justify,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                'It is advised to begin the registration process of your intellectual property rights within 12 months of posting your project online (including on the Zeazn Invest App) in case you plan on filing for an IP.\n\n',
                            style: Theme.of(
                              context,
                            ).textTheme.bodySmall?.copyWith(
                              color: ZAppColor.blackColor,
                              fontWeight: FontWeight.w400,
                              fontSize: ZAppSize.s14,
                            ),
                          ),
                          TextSpan(
                            text:
                                'This is to avoid the organizations that register your Intellectual Property Rights (Eg: WIPO) from denying your application, as all publicly displayed projects after 12 months are ineligible to claim ownership when applying for IP rights.\n\n',
                            style: Theme.of(
                              context,
                            ).textTheme.bodySmall?.copyWith(
                              color: ZAppColor.blackColor,
                              fontWeight: FontWeight.w400,
                              fontSize: ZAppSize.s14,
                            ),
                          ),
                          TextSpan(
                            text:
                                'Click this link to learn more about Intellectual Property Rights and how they can benefit your creative projects:\n',
                            style: Theme.of(
                              context,
                            ).textTheme.bodySmall?.copyWith(
                              color: ZAppColor.blackColor,
                              fontWeight: FontWeight.w400,
                              fontSize: ZAppSize.s14,
                            ),
                          ),
                          TextSpan(
                            text: 'https://www.wipo.int/en/web/about-i',
                            style: Theme.of(
                              context,
                            ).textTheme.bodySmall?.copyWith(
                              color: ZAppColor.primary,
                              fontWeight: FontWeight.w400,
                              fontSize: ZAppSize.s14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ZAppSize.s16.verticalSpace,
                    // continue button
                    Obx(
                      () => SizedBox(
                        width: ZDeviceUtil.getDeviceWidth(context) * 0.5,
                        child: ZCustomButton(
                          label: 'continue'.tr,
                          radius: ZAppSize.s5,
                          icon: Assets.icons.arrowRectDiag.svg(),
                          loading: ctrl.loading.value,
                          onTap: () {
                            ZHelperFunction.pop();
                            ctrl.addProjectRewards(context: context);
                          },
                        ),
                      ),
                    ),
                  ],
                ).scrollable(),
          ),
        );
        // return Container(
        //   height: ZDeviceUtil.getDeviceHeight(context) / 2,
        //   padding: EdgeInsets.all(ZAppSize.s16),
        //   decoration: BoxDecoration(
        //     color: ZAppColor.whiteColor,
        //     borderRadius: BorderRadius.circular(ZAppSize.s14),
        //   ),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [
        //       Text(
        //         'Dear Creator',
        //         style: Theme.of(context).textTheme.headlineSmall,
        //       ),
        //       RichText(
        //         text: TextSpan(
        //           children: [
        //             TextSpan(
        //               text:
        //                   'It is advised to begin the registration process of your intellectual property rights within 12 months of posting your project online (including on the Zeazn Invest App) in case you plan on filing for an IP.\n\n',
        //             ),
        //             TextSpan(
        //               text:
        //                   'This is to avoid the organizations that register your Intellectual Property Rights (Eg: WIPO) from denying your application, as all publicly displayed projects after 12 months are ineligible to claim ownership when applying for IP rights.\n\n',
        //             ),
        //             TextSpan(
        //               text:
        //                   'Click this link to learn more about Intellectual Property Rights and how they can benefit your creative projects:\n',
        //             ),
        //             TextSpan(text: 'https://www.wipo.int/en/web/about-i'),
        //           ],
        //         ),
        //       ),
        //       // Text('data')
        //     ],
        //   ),
        // );
      },
    );
  }

  Widget planWidget(BuildContext context, ZCreateProjectVM ctrl) {
    return Form(
      key: ctrl.rewardSetupFormKey,
      child:
          Column(
            children: [
              ZCustomTextField(
                labelText: '',
                hintText: 'price_hint'.tr,
                controller: ctrl.priceTEC,
                fillColor: ZAppColor.blackColor,
                filled: true,
                prefixIcon: null,
                validator: ZValidator.validateText,
                textInputType: TextInputType.numberWithOptions(decimal: true),
              ),
              ZAppSize.s16.verticalSpace,
              ZCustomTextField(
                labelText: '',
                hintText: 'experience_reward_title'.tr,
                controller: ctrl.titleTEC,
                fillColor: ZAppColor.blackColor,
                filled: true,
                prefixIcon: null,
                validator: ZValidator.validateText,
                textInputType: TextInputType.name,
              ),
              ZAppSize.s16.verticalSpace,
              ZCustomTextField(
                labelText: '',
                hintText: 'description_hint'.tr,
                controller: ctrl.descriptionTEC,
                fillColor: ZAppColor.blackColor,
                filled: true,
                prefixIcon: null,
                maxLines: 4,
                validator: ZValidator.validateText,
                textInputType: TextInputType.multiline,
              ),
              ZAppSize.s16.verticalSpace,
              ZCountryCodePicker(label: ''.tr, ctrl: ctrl),
              // ZCustomTextField(
              //   labelText: '',
              //   hintText: 'location'.tr,
              //   fillColor: ZAppColor.blackColor,
              //   filled: true,
              //   prefixIcon: null,
              //   textInputType: TextInputType.text,
              //   onChanged: (val) => plan.location = val,
              // ),
              ZAppSize.s16.verticalSpace,
              ZCustomTextField(
                labelText: '',
                controller: ctrl.slotsTEC,
                hintText: 'slots_available'.tr,
                fillColor: ZAppColor.blackColor,
                filled: true,
                prefixIcon: null,
                validator: ZValidator.validateText,
                textInputType: TextInputType.number,
              ),
              ZAppSize.s16.verticalSpace,
              SizedBox(
                height: ZDeviceUtil.getDeviceHeight(context) * 0.12,
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: ZCustomContainer(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                ctrl.selectedDateTime.value.isEmpty
                                    ? 'date_time'.tr
                                    : ctrl.selectedDateTime.value,
                                textAlign: TextAlign.start,
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyLarge?.copyWith(
                                  fontSize: ZAppSize.s14,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      ctrl.selectedDateTime.value.isEmpty
                                          ? ZAppColor.hintTextColor
                                          : ZAppColor.whiteColor,
                                ),
                              ),
                            ),
                            ZAppSize.s6.verticalSpace,
                            Row(
                              children: [
                                Assets.icons.calendarIcon.svg(),
                                ZAppSize.s8.horizontalSpace,
                                Assets.icons.clockIcon.svg(),
                              ],
                            ),
                          ],
                        ),
                      ).onPressed(
                        onTap: () {
                          // ctrl.updateSelectedExperienceIndex(index);
                          ctrl.showDateTimePicker();
                        },
                      ),
                    ),
                    // ZAppSize.s14.horizontalSpace,
                    // Expanded(
                    //   flex: 1,
                    //   child: ZCustomContainer(
                    //     height: ZDeviceUtil.getDeviceHeight(context),
                    //     child: Row(
                    //       children: [
                    //         Expanded(
                    //           child: Text(
                    //             'add'.tr,
                    //             textAlign: TextAlign.start,
                    //             style: Theme.of(
                    //               context,
                    //             ).textTheme.bodyLarge?.copyWith(
                    //               fontSize: ZAppSize.s14,
                    //               fontWeight: FontWeight.w500,
                    //               color: ZAppColor.hintTextColor,
                    //             ),
                    //           ),
                    //         ),
                    //         Assets.icons.addIcon.svg(color: ZAppColor.hintTextColor),
                    //         // Icon(Icons.add, color: ZAppColor.hintTextColor),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ).only(bottom: ZAppSize.s24).scrollable(),
    );
  }
}
