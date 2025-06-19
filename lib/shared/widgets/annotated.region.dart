import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';

class PAnnotatedRegion extends StatelessWidget {
  final Widget child;
  const PAnnotatedRegion({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value:
          ZHelperFunction.isDarkMode(context)
              ? SystemUiOverlayStyle.light
              : const SystemUiOverlayStyle(
                statusBarBrightness: Brightness.dark,
                statusBarIconBrightness: Brightness.dark,
                statusBarColor: ZAppColor.transparentColor,
                systemNavigationBarColor: ZAppColor.whiteColor,
                systemNavigationBarIconBrightness: Brightness.light,
                systemNavigationBarDividerColor: ZAppColor.transparentColor,
              ),
      child: child,
    );
  }
}
