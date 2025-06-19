import 'package:flutter/material.dart';
import 'package:zeazn_invest_app/core/utils/constants/app.colors.dart';

class CustomIndicatorShape extends ShapeBorder {
  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(10);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..addOval(Rect.fromCircle(center: rect.center, radius: rect.width / 3));
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..addOval(Rect.fromCircle(center: rect.center, radius: rect.width / 3));
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final Paint paint =
        Paint()..color = ZAppColor.primary; // You can customize the color
    canvas.drawCircle(rect.center, rect.width / 3, paint);
  }

  @override
  ShapeBorder scale(double t) {
    return CustomIndicatorShape();
  }
}
