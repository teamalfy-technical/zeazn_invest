import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/creator/explore/presentation/vm/explore.vm.dart';
import 'package:zeazn_invest_app/routes/app.pages.dart';
import 'package:zeazn_invest_app/shared/shared.dart';

class ZFundingDetailsPage extends StatelessWidget {
  ZFundingDetailsPage({super.key});
  final ctrl = Get.put(ZExploreVM());

  @override
  Widget build(BuildContext context) {
    return ZZeaznScaffold(
      backgroundColor: ZAppColor.darkColor,
      resizeToAvoidBottomInset: false,
      child: Obx(
        () => Column(
          children: [
            ZAppSize.s20.verticalSpace,
            Text(
              'funding_details'.tr,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(),
            ),
            ZAppSize.s5.verticalSpace,
            Text(
              'funding_details_desc'.tr,
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: ZAppColor.offWhiteColor),
            ),
            ZAppSize.s25.verticalSpace,
            Text(
              ZFormatter.formatCurrency(amount: ctrl.sliderValue.value),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(),
            ),
            Expanded(
              child:
                  Column(
                    children: [
                      ZAppSize.s20.verticalSpace,
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              tickMarkShape: VerticalTickMarkShape(),
                              thumbShape: BorderedThumbShape(),
                            ),
                            child: Slider(
                              min: ctrl.min,
                              max: ctrl.max,
                              value: ctrl.sliderValue.value,
                              divisions: ZAppSize.s10.toInt(),
                              label: ZFormatter.formatCurrency(
                                amount: ctrl.sliderValue.value,
                              ),
                              onChanged: ctrl.onSliderChanged,
                            ),
                          ),
                          Positioned(
                            right: ZDeviceUtil.getDeviceWidth(context) * 0.1,
                            child: Text(
                              ZFormatter.formatCurrency(amount: 20000),
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(fontSize: ZAppSize.s8),
                            ),
                          ),
                          Positioned(
                            right: ZDeviceUtil.getDeviceWidth(context) * 0.1,
                            bottom: 0,
                            child: Text(
                              'aggressive'.tr,
                              style: Theme.of(
                                context,
                              ).textTheme.bodySmall?.copyWith(
                                fontSize: ZAppSize.s8,
                                color: ZAppColor.text100,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            left: 0,
                            bottom: 0,
                            child:
                                Text(
                                  'moderate'.tr,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodySmall?.copyWith(
                                    fontSize: ZAppSize.s8,
                                    color: ZAppColor.text100,
                                  ),
                                ).centered(),
                          ),
                          Align(
                            alignment: Alignment.center,
                            // left: 0,
                            // right: 0,
                            child: Text(
                              ZFormatter.formatCurrency(amount: 10000),
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(fontSize: ZAppSize.s8),
                            ),
                          ),
                        ],
                      ),
                      ZAppSize.s20.verticalSpace,
                      ZCustomTextField(
                        labelText: 'input_budget_label'.tr,
                        hintText: 'input_budget_hint'.tr,
                        fillColor: ZAppColor.blackColor,
                        filled: true,
                        prefixIcon: null,
                        textInputType: TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        controller: ctrl.budgetTEC,
                      ),
                      ZAppSize.s20.verticalSpace,
                      Container(
                        width: ZDeviceUtil.getDeviceWidth(context),
                        padding: EdgeInsets.symmetric(
                          vertical: ZAppSize.s14,
                          horizontal: ZAppSize.s10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(ZAppSize.s5),
                          color: ZAppColor.transparentColor,
                          border: Border.all(
                            width: 2,
                            color: ZAppColor.whiteColor,
                          ),
                        ),
                        child: RichText(
                          text: TextSpan(
                            text: '${'use_of_funds'.tr}: ',
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(fontWeight: FontWeight.w700),
                            children: [
                              TextSpan(
                                text: 'use_of_funds_desc'.tr,
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ).scrollable(),
            ),
            ZAppSize.s24.verticalSpace,
            Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                width: ZDeviceUtil.getDeviceWidth(context) * 0.50,
                child: ZCustomButton(
                  label: 'next'.tr,
                  radius: ZAppSize.s5,
                  onTap:
                      () => ZHelperFunction.switchScreen(
                        destination: Routes.exclusiveExperiencesPage,
                      ),
                ),
              ),
            ),
            ZAppSize.s24.verticalSpace,
          ],
        ),
      ),
    );
  }
}
