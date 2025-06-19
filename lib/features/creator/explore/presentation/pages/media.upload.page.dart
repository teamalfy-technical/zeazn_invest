import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/creator/explore/presentation/vm/explore.vm.dart';
import 'package:zeazn_invest_app/features/creator/explore/presentation/widgets/video.player.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';
import 'package:zeazn_invest_app/shared/shared.dart';
import 'package:zeazn_invest_app/shared/widgets/custom.outlined.button.dart';

class ZMediaUploadPage extends StatelessWidget {
  ZMediaUploadPage({super.key});
  final ctrl = Get.put(ZExploreVM());

  @override
  Widget build(BuildContext context) {
    return ZZeaznScaffold(
      backgroundColor: ZAppColor.darkColor,
      resizeToAvoidBottomInset: false,
      child: Column(
        children: [
          ZAppSize.s20.verticalSpace,
          Text(
            'media_upload'.tr,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(),
          ),
          Text(
            'media_upload_desc'.tr,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
          ),
          ZAppSize.s20.verticalSpace,
          Expanded(
            child: Column(
              children: [
                ZCustomOutlinedButton(
                  onTap: () => ctrl.chooseMediaFiles(),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'upload_from_device'.tr,
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(overflow: TextOverflow.ellipsis),
                        ),
                      ),
                      ZAppSize.s20.horizontalSpace,
                      Assets.icons.arrowRectDiag.svg(height: ZAppSize.s32),
                    ],
                  ),
                ),
                ZAppSize.s20.verticalSpace,
                Expanded(
                  child: GetBuilder<ZExploreVM>(
                    builder: (controller) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.media.length,
                        itemBuilder: (context, index) {
                          return ZVideoPlayer(file: controller.media[index]);
                        },
                      );
                    },
                  ),
                ),
                ZAppSize.s24.verticalSpace,
                Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    width: ZDeviceUtil.getDeviceWidth(context) * 0.50,
                    child: ZCustomButton(
                      label: 'next'.tr,
                      radius: ZAppSize.s5,
                      onTap: ctrl.gotoFundingDetailsPage,
                    ),
                  ),
                ),
                ZAppSize.s24.verticalSpace,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
