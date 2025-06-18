import 'package:flutter/material.dart';

class AppPageView extends StatelessWidget {
  final int? itemCount;
  final Axis? scrollDirection;
  final bool? shrinkWrap;
  final EdgeInsetsGeometry? padding;
  final ScrollPhysics? physics;
  final PageController? controller;
  final Widget? Function(BuildContext, int) itemBuilder;
  const AppPageView({
    super.key,
    this.itemCount,
    this.scrollDirection,
    this.shrinkWrap,
    this.padding,
    this.physics,
    this.controller,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: scrollDirection ?? Axis.horizontal,
      physics: physics,
      controller: controller ?? PageController(viewportFraction: 1.0),
      itemCount: itemCount ?? 4,

      itemBuilder: itemBuilder,
    );
  }
}
