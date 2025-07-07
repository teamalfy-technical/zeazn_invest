import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';

class ZCustomLoadingIndicator extends StatelessWidget {
  final double size;
  final Color color;
  final bool centered;

  const ZCustomLoadingIndicator({
    super.key,
    this.size = ZAppSize.s20,
    this.color = ZAppColor.whiteColor,
    this.centered = true,
  });

  @override
  Widget build(BuildContext context) {
    return centered
        ? Center(
          child:
              Platform.isIOS
                  ? CupertinoActivityIndicator(color: color, radius: size / 2)
                  : SizedBox(
                    width: size,
                    height: size,
                    child: CircularProgressIndicator(color: color),
                  ),
        )
        : CircularProgressIndicator.adaptive(backgroundColor: color);

    // Platform.isIOS
    //     ? CupertinoActivityIndicator(
    //         color: color,
    //         radius: size / 2,
    //       )
    //     : SizedBox(
    //         width: size,
    //         height: size,
    //         child: CircularProgressIndicator(
    //           color: color,
    //         ));
  }
}
