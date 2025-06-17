import 'package:flutter/material.dart';
import 'package:home_decor_app/core/helper/extensions.dart';

class AppGridView extends StatelessWidget {
  final int? itemCount;
  final bool? shrinkWrap;

  final EdgeInsetsGeometry? padding;
  final SliverGridDelegate? gridDelegate;
  final Widget Function(BuildContext, int) itemBuilder;
  const AppGridView({
    super.key,
    required this.itemCount,
    this.padding,
    this.gridDelegate,
    this.shrinkWrap,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: shrinkWrap ?? false,
      itemCount: itemCount ?? 0,
      padding:
          padding ??
          EdgeInsets.symmetric(
            horizontal: context.screenWidth / 35,
            vertical: context.screenHeight / 35,
          ),
      gridDelegate:
          gridDelegate ??
          SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 2.2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
      itemBuilder: itemBuilder,
    );
  }
}
