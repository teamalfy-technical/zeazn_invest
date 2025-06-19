import 'package:flutter/material.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';

class VerticalTickMarkShape extends SliderTickMarkShape {
  @override
  Size getPreferredSize({
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
  }) {
    return const Size(1, 8); // thin vertical line
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required Offset thumbCenter,
    required bool isEnabled,
    required TextDirection textDirection,
  }) {
    final Canvas canvas = context.canvas;
    final paint =
        Paint()
          ..color = sliderTheme.activeTickMarkColor ?? ZAppColor.text300
          ..strokeWidth = 1;

    final tickHeight = 8.0;
    final start = Offset(center.dx, center.dy - tickHeight / 2);
    final end = Offset(center.dx, center.dy + tickHeight / 2);

    canvas.drawLine(start, end, paint);
  }
}
