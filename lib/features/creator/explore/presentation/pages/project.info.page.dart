import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/creator/explore/domain/models/project.model.dart';
import 'package:zeazn_invest_app/features/creator/explore/presentation/vm/create.project.vm.dart';
import 'package:zeazn_invest_app/shared/shared.dart';

class ZProjectInfoPage extends StatefulWidget {
  const ZProjectInfoPage({super.key});

  @override
  State<ZProjectInfoPage> createState() => _ZProjectInfoPageState();
}

class _ZProjectInfoPageState extends State<ZProjectInfoPage> {
  final ctrl = Get.put(ZCreateProjectVM());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ctrl.getCategories(context: context);
    });
    super.initState();
  }

  Widget scanningDataWidget({
    required BuildContext context,
    required Widget content,
    required String label,
    Widget? leadingIcon,
    Widget? trailingIcon,
    Alignment alignment = Alignment.centerLeft,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        ZAppSize.s4.verticalSpace,
        Container(
          alignment: alignment,
          width: double.infinity,
          height: ZAppSize.s48,
          padding: EdgeInsets.only(left: ZAppSize.s0, right: ZAppSize.s6),
          decoration: BoxDecoration(
            color: ZAppColor.blackColor,
            borderRadius: BorderRadius.circular(ZAppSize.s5),
            border: Border.all(width: ZAppSize.s1, color: ZAppColor.primary),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: content),
              trailingIcon ?? SizedBox.shrink(),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ZZeaznScaffold(
      backgroundColor: ZAppColor.darkColor,
      resizeToAvoidBottomInset: false,
      child: Form(
        key: ctrl.projectInfoFormKey,
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
                        validator: ZValidator.validateText,
                        fillColor: ZAppColor.blackColor,
                        filled: true,
                        prefixIcon: null,
                        controller: ctrl.titleTEC,
                      ),

                      ZAppSize.s20.verticalSpace,

                      GetBuilder<ZCreateProjectVM>(
                        builder: (ctrl) {
                          return ZCustomDropdown<ProjectCategory>(
                            label: 'category'.tr,
                            hintText: 'hint_category'.tr,
                            value: ctrl.selectedCategory,
                            onChanged: ctrl.onProjectCategoryChanged,
                            items:
                                ctrl.categories
                                    .map(
                                      (e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(
                                          '${e.name}',
                                          style:
                                              Theme.of(
                                                context,
                                              ).textTheme.bodySmall,
                                        ),
                                      ),
                                    )
                                    .toList(),
                          );
                        },
                      ),

                      ZAppSize.s20.verticalSpace,
                      ZCustomTextField(
                        labelText: 'short_description'.tr,
                        hintText: 'hint_short_description'.tr,
                        validator: ZValidator.validateText,
                        fillColor: ZAppColor.blackColor,
                        filled: true,
                        prefixIcon: null,
                        controller: ctrl.shortDescriptionTEC,
                      ),

                      ZAppSize.s20.verticalSpace,
                      ZCustomTextField(
                        labelText: 'description'.tr,
                        hintText: 'hint_description'.tr,
                        validator: ZValidator.validateText,
                        fillColor: ZAppColor.blackColor,
                        filled: true,
                        prefixIcon: null,
                        maxLines: 6,
                        controller: ctrl.descriptionTEC,
                      ),
                      ZAppSize.s20.verticalSpace,
                      ZCountryCodePicker(label: 'location'.tr, ctrl: ctrl),
                    ],
                  ).scrollable(),
            ),
            ZAppSize.s16.verticalSpace,
            Obx(
              () => Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                  width: ZDeviceUtil.getDeviceWidth(context) * 0.50,
                  child: ZCustomButton(
                    label: 'next'.tr,
                    radius: ZAppSize.s5,
                    loading: ctrl.loading.value,
                    onTap: () {
                      if (ctrl.projectInfoFormKey.currentState!.validate()) {
                        ctrl.addProject(context: context);
                      }
                    },
                  ),
                ),
              ),
            ),
            ZAppSize.s20.verticalSpace,
          ],
        ),
      ),
    );
  }
}
