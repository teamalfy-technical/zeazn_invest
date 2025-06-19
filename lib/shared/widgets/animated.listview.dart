import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';

class AnimatedListView<T> extends StatelessWidget {
  final Widget Function(int index, T item) child;
  final int duration;
  final List<T> items;
  final bool shrinkWrap;
  final bool animate;
  final ScrollPhysics physics;
  final ScrollController? scrollController;
  final Axis scrollDirection;
  const AnimatedListView({
    super.key,
    required this.child,
    this.scrollController,
    this.scrollDirection = Axis.vertical,
    this.duration = ZAppSize.s500,
    this.shrinkWrap = false,
    this.animate = true,
    required this.items,
    this.physics = const BouncingScrollPhysics(),
  });

  @override
  Widget build(BuildContext context) {
    return animate
        ? AnimationLimiter(
          child: ListView.builder(
            itemCount: items.length,
            shrinkWrap: shrinkWrap,
            controller: scrollController,
            scrollDirection: scrollDirection,
            physics: physics,
            itemBuilder: (BuildContext context, int index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: Duration(milliseconds: duration),
                child: SlideAnimation(
                  verticalOffset: ZAppSize.s50,
                  child: FadeInAnimation(child: child(index, items[index])),
                ),
              );
            },
          ),
        )
        : ListView.builder(
          itemCount: items.length,
          shrinkWrap: shrinkWrap,
          controller: scrollController,
          physics: physics,
          itemBuilder:
              (BuildContext context, int index) => child(index, items[index]),
        );
  }
}
