import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/creator/explore/explore.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';
import 'package:zeazn_invest_app/shared/shared.dart';

class ZVideoUploadPage extends StatelessWidget {
  ZVideoUploadPage({super.key});
  // final ctrl = Get.put(ZCreateProjectVM());
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
            'video_upload'.tr,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(),
          ),
          Text(
            'video_upload_desc'.tr,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
          ),
          ZAppSize.s20.verticalSpace,
          Expanded(
            child: Column(
              children: [
                ZCustomOutlinedButton(
                  onTap: () => ctrl.chooseIntroVideo(),
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
                  child: GetBuilder<ZCreateProjectVM>(
                    builder: (ctrl) {
                      // final file = ctrl.files[0];
                      // return file.fileType == FileType.image
                      //     ? ZImageView(file: file)
                      //     : ZVideoPlayer(file: file);
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: ctrl.files.length,
                        itemBuilder: (context, index) {
                          final file = ctrl.files[index];
                          return file.fileType == FileType.image
                              ? ZImageView(file: file)
                              : ZVideoPlayer(file: file);
                        },
                      );
                    },
                  ),
                ),

                ZAppSize.s24.verticalSpace,
                Obx(
                  () => Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      width: ZDeviceUtil.getDeviceWidth(context) * 0.50,
                      child: ZCustomButton(
                        label: 'next'.tr,
                        radius: ZAppSize.s5,
                        loading: ctrl.loading.value,
                        onTap: () => ctrl.gotoMediaUploadPage(context: context),
                      ),
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
