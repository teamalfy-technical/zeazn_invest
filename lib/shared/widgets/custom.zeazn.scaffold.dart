import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/features/auth/signup/presentation/vm/signup.vm.dart';
import 'package:zeazn_invest_app/gen/assets.gen.dart';

class ZZeaznScaffold extends StatelessWidget {
  final Color backgroundColor;
  final Widget child;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final SvgPicture? logoPath;
  final bool? resizeToAvoidBottomInset;
  final PreferredSizeWidget? appBar;
  final bool extendBodyBehindAppBar;
  const ZZeaznScaffold({
    super.key,
    this.backgroundColor = ZAppColor.blackColor,
    required this.child,
    this.bottomNavigationBar,
    this.logoPath,
    this.resizeToAvoidBottomInset,
    this.appBar,
    this.extendBodyBehindAppBar = false,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      backgroundColor: backgroundColor,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Get.put(ZSignupVm()).role.value == UserRole.creator
                    ? Assets.icons.toggleCreator
                        .svg() //Image.asset(Assets.images.toggleCreator.path)
                    : Assets.icons.toggleSupporter
                        .svg(), // Image.asset(Assets.images.toggleSupporter.path),
                logoPath ?? Assets.icons.logoLight.svg(height: ZAppSize.s55),
                //   Image.asset(logoPath ?? Assets.images.logoLight.path),
              ],
            ),
            Expanded(child: child),
          ],
        ).symmetric(horizontal: ZAppSize.s18),
      ),
    );
  }
}
