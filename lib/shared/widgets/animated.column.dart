import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';

class AnimatedColumnWidget extends StatelessWidget {
  final List<Widget> children;
  final AnimateType animateType;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final int duration;

  const AnimatedColumnWidget({
    super.key,
    required this.children,
    this.animateType = AnimateType.slideUp,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.duration = ZAppSize.s500,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    if (animateType == AnimateType.slideUp) {
      return AnimationLimiter(
        child: Column(
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          mainAxisSize: mainAxisSize,
          children: AnimationConfiguration.toStaggeredList(
            duration: Duration(milliseconds: duration),
            childAnimationBuilder:
                (widget) => SlideAnimation(
                  verticalOffset: ZAppSize.s50,
                  child: SlideAnimation(child: widget),
                ),
            children: children,
          ),
        ),
      );
    } else {
      return AnimationLimiter(
        child: Column(
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          mainAxisSize: mainAxisSize,
          children: AnimationConfiguration.toStaggeredList(
            duration: Duration(milliseconds: duration),
            childAnimationBuilder:
                (widget) => SlideAnimation(
                  horizontalOffset: ZAppSize.s50,
                  child: FadeInAnimation(child: widget),
                ),
            children: children,
          ),
        ),
      );
    }
  }
}
