import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/routes/app.pages.dart';
import 'package:zeazn_invest_app/shared/shared.dart';

class ZProjectInfoPage extends StatelessWidget {
  const ZProjectInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ZZeaznScaffold(
      backgroundColor: ZAppColor.darkColor,
      resizeToAvoidBottomInset: false,
      child: Column(
        children: [
          ZAppSize.s20.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.arrow_back_ios,
                color: ZAppColor.whiteColor,
              ).onPressed(onTap: () => ZHelperFunction.pop()),
              Text(
                'project_setup'.tr,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(),
              ),
            ],
          ),
          Expanded(
            child:
                Column(
                  children: [
                    ZAppSize.s24.verticalSpace,
                    ZCustomTextField(
                      labelText: 'project_title'.tr,
                      hintText: 'hint_project_title'.tr,
                      fillColor: ZAppColor.blackColor,
                      filled: true,
                      prefixIcon: null,
                      controller: TextEditingController(),
                    ),

                    ZAppSize.s20.verticalSpace,

                    ZCustomDropdown<String>(
                      label: 'category'.tr,
                      hintText: 'hint_category'.tr,
                      value: null,
                      items: ['g', 'f'],
                    ),

                    ZAppSize.s20.verticalSpace,
                    ZCustomTextField(
                      labelText: 'description'.tr,
                      hintText: 'hint_description'.tr,
                      fillColor: ZAppColor.blackColor,
                      filled: true,
                      prefixIcon: null,
                      maxLines: 6,
                      controller: TextEditingController(),
                    ),
                    ZAppSize.s20.verticalSpace,

                    ZCustomDropdown<String>(
                      label: 'location'.tr,
                      hintText: 'hint_location'.tr,
                      value: null,
                      items: ['g', 'f'],
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
                                destination: Routes.videoUploadPage,
                              ),
                        ),
                      ),
                    ),
                  ],
                ).scrollable(),
          ),
        ],
      ),
    );
  }
}
