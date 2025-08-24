import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:home_decor_app/core/networks/api_constants.dart';

class AppCahedNetworkImage extends StatelessWidget {
  final String image;
  final double? width;
  final double? height;
  final Widget placeholder;
  final BoxFit? fit;

  const AppCahedNetworkImage({
    super.key,

    required this.image,
    this.width,
    this.fit,
    this.height,
    required this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: "${ApiConstants.baseUrlImage}$image",
      height: height,
      width: width,
      fit: fit ?? BoxFit.contain,
      placeholder: (context, url) {
        return placeholder;
      },
      errorWidget: (context, url, error) {
        return Icon(Icons.error, color: Colors.red);
      },
    );
  }
}
