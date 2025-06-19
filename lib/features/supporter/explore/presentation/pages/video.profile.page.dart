import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/creator/explore/presentation/vm/explore.vm.dart';
import 'package:zeazn_invest_app/features/creator/explore/presentation/widgets/video.player.url.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';
import 'package:zeazn_invest_app/shared/shared.dart';

class ZVideoProfilePage extends StatelessWidget {
  ZVideoProfilePage({super.key});
  final ctrl = Get.put(ZExploreVM());

  @override
  Widget build(BuildContext context) {
    return ZZeaznScaffold(
      backgroundColor: ZAppColor.offWhiteColor,
      logoPath: Assets.icons.logoDark.svg(height: ZAppSize.s55),
      resizeToAvoidBottomInset: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ZAppSize.s20.verticalSpace,

          Icon(
            Icons.arrow_back_ios,
            color: ZAppColor.blackColor,
          ).onPressed(onTap: () => ZHelperFunction.pop()),

          ZAppSize.s8.verticalSpace,

          ZAppSize.s20.verticalSpace,
          Expanded(
            child: ZVideoPlayerURL(
              url:
                  'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
            ),
          ),
        ],
      ),
    );
  }
}
