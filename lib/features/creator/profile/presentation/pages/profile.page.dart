import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/creator/profile/profile.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';
import 'package:zeazn_invest_app/routes/app.pages.dart';
import 'package:zeazn_invest_app/shared/shared.dart';

class ZProfilePage extends StatelessWidget {
  final UserRole role;
  ZProfilePage({super.key, required this.role});

  final ctrl = Get.put(ZProfileVM());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ZAppColor.offWhiteColor,
      // logoPath: Assets.images.zeaznLogoDark.path,
      body: SafeArea(
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ZAppSize.s20.verticalSpace,
              if (role == UserRole.investor || role == UserRole.creator)
                // IconButton(
                //   onPressed: () => ZHelperFunction.pop(),
                //   icon: Icon(
                //     Icons.arrow_back_ios,
                //     color: ZAppColor.blackColor,
                //   ),
                // ),
                Icon(
                  Icons.arrow_back_ios,
                  color: ZAppColor.blackColor,
                ).onPressed(onTap: () => ZHelperFunction.pop()),

              Expanded(
                child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // profile image
                        Stack(
                          children: [
                            Container(
                              // padding: EdgeInsets.all(ZAppSize.s24),
                              width: ZAppSize.s170,
                              height: ZAppSize.s170,
                              decoration:
                                  ctrl.profileFile.value.path.isEmpty
                                      ? BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ZAppColor.blackColor,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                            Assets
                                                .images
                                                .supporterSlideOne
                                                .path,
                                          ),
                                        ),
                                      )
                                      : BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ZAppColor.blackColor,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: FileImage(
                                            ctrl.profileFile.value,
                                          ),
                                        ),
                                      ),
                            ).onPressed(onTap: () => ctrl.chooseFromGallery()),
                            // PCachedImageWidget(url: url, height: height),
                            Positioned(
                              right: ZAppSize.s4,
                              bottom: 0,
                              child: Assets.icons.addCircleIcon.svg().onPressed(
                                onTap: () => ctrl.chooseFromGallery(),
                              ),
                            ),
                          ],
                        ).centered(),

                        ZAppSize.s20.verticalSpace,
                        // Name
                        ZCustomExpansionTile(
                          title: Text(
                            'name'.tr,
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w400,
                              color: ZAppColor.blackColor,
                            ),
                          ),
                          isExpanded: true,
                          showDivider: false,
                          expandedIcon: Assets.icons.arrowDownIos.svg(
                            color: ZAppColor.primary,
                          ),
                          collapsedIcon: Assets.icons.arrowForwardIos.svg(
                            color: ZAppColor.text500,
                          ),
                          children: [
                            Container(
                              width: ZDeviceUtil.getDeviceWidth(context),
                              padding: EdgeInsets.all(ZAppSize.s16),
                              margin: EdgeInsets.only(right: ZAppSize.s50),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  ZAppSize.s10,
                                ),
                                border: Border.all(
                                  width: ZAppSize.s0_5,
                                  color: ZAppColor.dividerColor,
                                ),
                              ),
                              child: Text(
                                'Angela White',
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: ZAppColor.text500,
                                ),
                              ),
                            ),
                          ],
                        ),

                        // Email
                        ZCustomExpansionTile(
                          title: Text(
                            'email'.tr,
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w400,
                              color: ZAppColor.blackColor,
                            ),
                          ),
                          showDivider: false,
                          expandedIcon: Assets.icons.arrowDownIos.svg(
                            color: ZAppColor.primary,
                          ),
                          collapsedIcon: Assets.icons.arrowForwardIos.svg(
                            color: ZAppColor.text500,
                          ),
                          children: [
                            Container(
                              width: ZDeviceUtil.getDeviceWidth(context),
                              padding: EdgeInsets.all(ZAppSize.s16),
                              margin: EdgeInsets.only(right: ZAppSize.s50),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  ZAppSize.s10,
                                ),
                                border: Border.all(
                                  width: ZAppSize.s0_5,
                                  color: ZAppColor.dividerColor,
                                ),
                              ),
                              child: Text(
                                'angelawhite@gmail.com',
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: ZAppColor.text500,
                                ),
                              ),
                            ),
                          ],
                        ),

                        // location
                        ZCustomExpansionTile(
                          title: Text(
                            'location'.tr,
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w400,
                              color: ZAppColor.blackColor,
                            ),
                          ),
                          showDivider: false,
                          expandedIcon: Assets.icons.arrowDownIos.svg(
                            color: ZAppColor.primary,
                          ),
                          collapsedIcon: Assets.icons.arrowForwardIos.svg(
                            color: ZAppColor.text500,
                          ),
                          children: [
                            Container(
                              width: ZDeviceUtil.getDeviceWidth(context),
                              padding: EdgeInsets.all(ZAppSize.s16),
                              margin: EdgeInsets.only(right: ZAppSize.s50),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  ZAppSize.s10,
                                ),
                                border: Border.all(
                                  width: ZAppSize.s0_5,
                                  color: ZAppColor.dividerColor,
                                ),
                              ),
                              child: Text(
                                'California, United States',
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: ZAppColor.text500,
                                ),
                              ),
                            ),
                          ],
                        ),

                        // Phone Number
                        ZCustomExpansionTile(
                          title: Text(
                            'phone'.tr,
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w400,
                              color: ZAppColor.blackColor,
                            ),
                          ),

                          expandedIcon: Assets.icons.arrowDownIos.svg(
                            color: ZAppColor.primary,
                          ),
                          collapsedIcon: Assets.icons.arrowForwardIos.svg(
                            color: ZAppColor.text500,
                          ),
                          showDivider: false,
                          children: [
                            Container(
                              width: ZDeviceUtil.getDeviceWidth(context),
                              padding: EdgeInsets.all(ZAppSize.s16),
                              margin: EdgeInsets.only(right: ZAppSize.s50),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  ZAppSize.s10,
                                ),
                                border: Border.all(
                                  width: ZAppSize.s0_5,
                                  color: ZAppColor.dividerColor,
                                ),
                              ),
                              child: Text(
                                '233546788890',
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: ZAppColor.text500,
                                ),
                              ),
                            ),
                          ],
                        ),

                        // Social Media Handles
                        ZCustomExpansionTile(
                          title: Text(
                            'social_media_handles'.tr,
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w400,
                              color: ZAppColor.blackColor,
                            ),
                          ),
                          expandedIcon: Assets.icons.arrowDownIos.svg(
                            color: ZAppColor.primary,
                          ),
                          collapsedIcon: Assets.icons.arrowForwardIos.svg(
                            color: ZAppColor.text500,
                          ),
                          isExpanded: true,
                          showDivider: false,
                          children: [
                            Row(
                              children: [
                                Assets.icons.facebookOutlineIcon.svg(),
                                ZAppSize.s10.horizontalSpace,
                                ZCustomOutlinedButton(
                                  backgroundColor: ZAppColor.transparentColor,
                                  borderColor: ZAppColor.dividerColor,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 0,
                                    horizontal: ZAppSize.s10,
                                  ),
                                  child: Row(
                                    children: [
                                      Assets.icons.addIcon.svg(
                                        color: ZAppColor.primary,
                                      ),
                                      ZAppSize.s10.horizontalSpace,
                                      Text(
                                        'add'.tr,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodyMedium?.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: ZAppColor.text500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        if (role == UserRole.creator)
                          Column(
                            children: [
                              ZAppSize.s14.verticalSpace,
                              Text(
                                'create_new_project'.tr,
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: ZAppColor.blackColor,
                                ),
                              ).onPressed(
                                onTap:
                                    () => ZHelperFunction.switchScreen(
                                      destination: Routes.projectInfoPage,
                                    ),
                              ),
                            ],
                          ),

                        if (role == UserRole.investor)
                          Column(
                            children: [
                              ZAppSize.s14.verticalSpace,
                              Text(
                                'upload_documents'.tr,
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: ZAppColor.blackColor,
                                ),
                              ).onPressed(
                                onTap: () {
                                  ZHelperFunction.switchScreen(
                                    destination: Routes.uploadLegalDocPage,
                                  );
                                },
                              ),
                            ],
                          ),

                        ZAppSize.s24.verticalSpace,
                        Text(
                          'logout'.tr,
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: ZAppColor.blackColor,
                          ),
                        ).onPressed(onTap: () => ctrl.signout()),
                        ZAppSize.s24.verticalSpace,
                        Text(
                          'delete_account'.tr,
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: ZAppColor.redColor,
                          ),
                        ).onPressed(onTap: () {}),
                        ZAppSize.s16.verticalSpace,
                      ],
                    ).scrollable(),
              ),
            ],
          ),
        ).symmetric(
          horizontal:
              (role == UserRole.investor || role == UserRole.creator)
                  ? ZAppSize.s18
                  : ZAppSize.s0,
        ),
      ),
    );
  }
}
