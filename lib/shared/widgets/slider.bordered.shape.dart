import 'package:flutter/material.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';

class BorderedThumbShape extends SliderComponentShape {
  final double thumbRadius;
  final double borderWidth;

  BorderedThumbShape({this.thumbRadius = 20.0, this.borderWidth = 3.0});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius + borderWidth);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    // Draw white border
    final Paint borderPaint =
        Paint()
          ..color = ZAppColor.text100
          ..style = PaintingStyle.stroke
          ..strokeWidth = borderWidth;

    // Draw filled thumb
    final Paint fillPaint =
        Paint()
          ..color = sliderTheme.thumbColor ?? ZAppColor.primary
          ..style = PaintingStyle.fill;

    canvas.drawCircle(center, thumbRadius + borderWidth / 2, borderPaint);
    canvas.drawCircle(center, thumbRadius, fillPaint);
  }
}
