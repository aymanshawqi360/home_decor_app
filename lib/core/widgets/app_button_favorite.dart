import 'package:flutter/material.dart';
import 'package:home_decor_app/core/theme/colors.dart';

class AppButtonFavorite extends StatelessWidget {
  final Color? backgroundColor;
  final IconData? icon;
  final double? size;
  final Color? color;
  final double? maxRadius;
  final double? minRadius;
  final void Function()? onTap;
  const AppButtonFavorite({
    super.key,
    this.backgroundColor,
    this.icon,
    this.color,
    this.size,
    this.maxRadius,
    this.minRadius,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        maxRadius: maxRadius ?? 15,
        minRadius: minRadius ?? 15,
        backgroundColor: backgroundColor ?? ColorsManager.ligthPink,

        child: Center(
          child: Icon(
            icon ?? Icons.favorite_rounded,
            size: size ?? 20,
            color: color ?? Colors.white,
          ),
        ),
      ),
    );
  }
}
