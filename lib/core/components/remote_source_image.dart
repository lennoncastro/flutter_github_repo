import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:github_repos/core/theme/colors.dart';

class RemoteSourceImage extends StatelessWidget {
  const RemoteSourceImage({
    required this.url,
    this.width = 36,
    this.height = 36,
    Key? key,
  }) : super(key: key);

  final String url;

  final double width;

  final double height;

  final double _borderRadius = 16.0;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: url,
      imageBuilder: (
        BuildContext context,
        ImageProvider<Object> imageProvider,
      ) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_borderRadius),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(
                ThemeColors.errorSnackBarColor,
                BlendMode.colorBurn,
              ),
            ),
          ),
        );
      },
      placeholder: (_, __) {
        return CircularProgressIndicator();
      },
      errorWidget: (_, __, ___) {
        return Icon(Icons.error);
      },
    );
  }
}
