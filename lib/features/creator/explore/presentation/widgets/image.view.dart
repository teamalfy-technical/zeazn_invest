import 'dart:io';

import 'package:flutter/material.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';

/// Stateful widget to fetch and then display video content.
class ZImageView extends StatelessWidget {
  final File file;

  const ZImageView({super.key, required this.file});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: ZAppSize.s20),
      height: ZAppSize.s200,
      width: ZDeviceUtil.getDeviceWidth(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ZAppSize.s8),
        image: DecorationImage(fit: BoxFit.cover, image: FileImage(file)),
      ),
    );
  }
}
