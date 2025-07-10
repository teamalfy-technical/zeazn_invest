import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:redacted/redacted.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/creator/profile/profile.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';
import 'package:zeazn_invest_app/routes/app.pages.dart';
import 'package:zeazn_invest_app/shared/shared.dart';

class ZProfilePage extends StatelessWidget {
  final UserRole role;
  final int? userId;
  ZProfilePage({super.key, required this.role, required this.userId});

  final ctrl = Get.put(ZProfileVM());

  @override
  Widget build(BuildContext context) {
    final currentUser = ZSecureStorage().getAuthResponse();
    zeaznLogger.i(userId);
    ctrl.getProfile(userId: userId);
    return Scaffold(
      backgroundColor: ZAppColor.offWhiteColor,
      // logoPath: Assets.images.zeaznLogoDark.path,
      body: SafeArea(
        child:
            Obx(
              () =>
                  // ctrl.loading.value == LoadingState.loading
                  //     ? ZCustomLoadingIndicator(color: ZAppColor.primary)
                  //     :
                  Column(
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
                        Icon(Icons.arrow_back_ios, color: ZAppColor.blackColor)
                            .onPressed(onTap: () => ZHelperFunction.pop())
                            .redacted(
                              context: context,
                              redact: ctrl.loading.value == LoadingState.loading
                                  ? true
                                  : false,
                            ),

                      Expanded(
                        child: Column(
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
                                ).onPressed(
                                  onTap: () => ctrl.chooseFromGallery(),
                                ),
                                // PCachedImageWidget(url: url, height: height),
                                Positioned(
                                  right: ZAppSize.s4,
                                  bottom: 0,
                                  child: Assets.icons.addCircleIcon
                                      .svg()
                                      .onPressed(
                                        onTap: () => ctrl.chooseFromGallery(),
                                      ),
                                ),
                              ],
                            ).centered().redacted(
                              context: context,
                              redact: ctrl.loading.value == LoadingState.loading
                                  ? true
                                  : false,
                            ),

                            ZAppSize.s20.verticalSpace,
                            // Name
                            ZCustomExpansionTile(
                              title:
                                  Text(
                                    'name'.tr,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: ZAppColor.blackColor,
                                        ),
                                  ).redacted(
                                    context: context,
                                    redact:
                                        ctrl.loading.value ==
                                            LoadingState.loading
                                        ? true
                                        : false,
                                  ),
                              isExpanded: true,
                              showDivider: false,
                              expandedIcon: Assets.icons.arrowDownIos
                                  .svg(color: ZAppColor.primary)
                                  .redacted(
                                    context: context,
                                    redact:
                                        ctrl.loading.value ==
                                            LoadingState.loading
                                        ? true
                                        : false,
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
                                    ctrl.userProfile.value.name ??
                                        'not_applicable'.tr,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: ZAppColor.text500,
                                        ),
                                  ),
                                ).redacted(
                                  context: context,
                                  redact:
                                      ctrl.loading.value == LoadingState.loading
                                      ? true
                                      : false,
                                ),
                              ],
                            ),

                            // Email
                            ZCustomExpansionTile(
                              title:
                                  Text(
                                    'email'.tr,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: ZAppColor.blackColor,
                                        ),
                                  ).redacted(
                                    context: context,
                                    redact:
                                        ctrl.loading.value ==
                                            LoadingState.loading
                                        ? true
                                        : false,
                                  ),
                              showDivider: false,
                              expandedIcon: Assets.icons.arrowDownIos.svg(
                                color: ZAppColor.primary,
                              ),
                              collapsedIcon: Assets.icons.arrowForwardIos
                                  .svg(color: ZAppColor.text500)
                                  .redacted(
                                    context: context,
                                    redact:
                                        ctrl.loading.value ==
                                            LoadingState.loading
                                        ? true
                                        : false,
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
                                    ctrl.userProfile.value.email ??
                                        'not_applicable'.tr,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: ZAppColor.text500,
                                        ),
                                  ),
                                ).redacted(
                                  context: context,
                                  redact:
                                      ctrl.loading.value == LoadingState.loading
                                      ? true
                                      : false,
                                ),
                              ],
                            ),

                            // location
                            ZCustomExpansionTile(
                              title:
                                  Text(
                                    'location'.tr,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: ZAppColor.blackColor,
                                        ),
                                  ).redacted(
                                    context: context,
                                    redact:
                                        ctrl.loading.value ==
                                            LoadingState.loading
                                        ? true
                                        : false,
                                  ),
                              showDivider: false,
                              expandedIcon: Assets.icons.arrowDownIos.svg(
                                color: ZAppColor.primary,
                              ),
                              collapsedIcon: Assets.icons.arrowForwardIos
                                  .svg(color: ZAppColor.text500)
                                  .redacted(
                                    context: context,
                                    redact:
                                        ctrl.loading.value ==
                                            LoadingState.loading
                                        ? true
                                        : false,
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
                                    ctrl.userProfile.value.country ??
                                        'not_applicable'.tr,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: ZAppColor.text500,
                                        ),
                                  ),
                                ).redacted(
                                  context: context,
                                  redact:
                                      ctrl.loading.value == LoadingState.loading
                                      ? true
                                      : false,
                                ),
                              ],
                            ),

                            // Phone Number
                            ZCustomExpansionTile(
                              title:
                                  Text(
                                    'phone'.tr,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: ZAppColor.blackColor,
                                        ),
                                  ).redacted(
                                    context: context,
                                    redact:
                                        ctrl.loading.value ==
                                            LoadingState.loading
                                        ? true
                                        : false,
                                  ),

                              expandedIcon: Assets.icons.arrowDownIos.svg(
                                color: ZAppColor.primary,
                              ),
                              collapsedIcon: Assets.icons.arrowForwardIos
                                  .svg(color: ZAppColor.text500)
                                  .redacted(
                                    context: context,
                                    redact:
                                        ctrl.loading.value ==
                                            LoadingState.loading
                                        ? true
                                        : false,
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
                                    ctrl.userProfile.value.phone ??
                                        'not_applicable'.tr,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: ZAppColor.text500,
                                        ),
                                  ),
                                ).redacted(
                                  context: context,
                                  redact:
                                      ctrl.loading.value == LoadingState.loading
                                      ? true
                                      : false,
                                ),
                              ],
                            ),

                            // Social Media Handles
                            ZCustomExpansionTile(
                              title:
                                  Text(
                                    'social_media_handles'.tr,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: ZAppColor.blackColor,
                                        ),
                                  ).redacted(
                                    context: context,
                                    redact:
                                        ctrl.loading.value ==
                                            LoadingState.loading
                                        ? true
                                        : false,
                                  ),
                              expandedIcon: Assets.icons.arrowDownIos
                                  .svg(color: ZAppColor.primary)
                                  .redacted(
                                    context: context,
                                    redact:
                                        ctrl.loading.value ==
                                            LoadingState.loading
                                        ? true
                                        : false,
                                  ),
                              collapsedIcon: Assets.icons.arrowForwardIos
                                  .svg(color: ZAppColor.text500)
                                  .redacted(
                                    context: context,
                                    redact:
                                        ctrl.loading.value ==
                                            LoadingState.loading
                                        ? true
                                        : false,
                                  ),
                              isExpanded: false,
                              showDivider: false,
                              children: [
                                Row(
                                  children: [
                                    Assets.icons.facebookOutlineIcon.svg(),
                                    ZAppSize.s10.horizontalSpace,
                                    ZCustomOutlinedButton(
                                      backgroundColor:
                                          ZAppColor.transparentColor,
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
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  color: ZAppColor.text500,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ).redacted(
                                  context: context,
                                  redact:
                                      ctrl.loading.value == LoadingState.loading
                                      ? true
                                      : false,
                                ),
                              ],
                            ),

                            if (currentUser?.role == UserRole.creator)
                              Column(
                                children: [
                                  ZAppSize.s14.verticalSpace,
                                  Text(
                                    'create_new_project'.tr,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: ZAppColor.blackColor,
                                        ),
                                  ).onPressed(
                                    onTap: () => ZHelperFunction.switchScreen(
                                      destination: Routes.projectInfoPage,
                                    ),
                                  ),
                                ],
                              ).redacted(
                                context: context,
                                redact:
                                    ctrl.loading.value == LoadingState.loading
                                    ? true
                                    : false,
                              ),

                            if (currentUser?.role == UserRole.creator)
                              Column(
                                children: [
                                  ZAppSize.s14.verticalSpace,
                                  Text(
                                    'upload_documents'.tr,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
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
                              ).redacted(
                                context: context,
                                redact:
                                    ctrl.loading.value == LoadingState.loading
                                    ? true
                                    : false,
                              ),

                            ZAppSize.s24.verticalSpace,
                            Text(
                                  'logout'.tr,
                                  style: Theme.of(context).textTheme.bodyMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: ZAppColor.blackColor,
                                      ),
                                )
                                .onPressed(onTap: () => ctrl.signout())
                                .redacted(
                                  context: context,
                                  redact:
                                      ctrl.loading.value == LoadingState.loading
                                      ? true
                                      : false,
                                ),
                            ZAppSize.s24.verticalSpace,
                            Text(
                                  'delete_account'.tr,
                                  style: Theme.of(context).textTheme.bodyMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: ZAppColor.redColor,
                                      ),
                                )
                                .onPressed(onTap: () {})
                                .redacted(
                                  context: context,
                                  redact:
                                      ctrl.loading.value == LoadingState.loading
                                      ? true
                                      : false,
                                ),
                            ZAppSize.s16.verticalSpace,
                          ],
                        ).scrollable(),
                      ),
                    ],
                  ),
            ).symmetric(
              horizontal:
                  (currentUser?.role == UserRole.investor ||
                      role == UserRole.creator)
                  ? ZAppSize.s18
                  : ZAppSize.s0,
            ),
      ),
    );
  }
}
