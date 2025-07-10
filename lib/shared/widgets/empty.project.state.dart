import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';
import 'package:zeazn_invest_app/routes/app.pages.dart';
import 'package:zeazn_invest_app/shared/shared.dart';

class ZEmptyProjectState extends StatelessWidget {
  final Widget? child;
  const ZEmptyProjectState({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          Assets.images.noProjectImg.path,
          // fit: BoxFit.cover,
          // height: ZDeviceUtil.getDeviceHeight(context) / 2,
        ),
        ZAppSize.s25.verticalSpace,
        child ??
            Column(
              children: [
                Text(
                  'no_projects_msg'.tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: ZAppColor.blackColor,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                ZAppSize.s12.verticalSpace,
                ZCustomMiniButton(
                  text: 'create_a_project'.tr,
                  onTap: () => ZHelperFunction.switchScreen(
                    destination: Routes.projectInfoPage,
                  ),
                ),
              ],
            ),
      ],
    ).scrollable();
  }
}
