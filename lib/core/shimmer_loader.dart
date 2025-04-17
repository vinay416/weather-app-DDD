import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather_app_ddd/theme/app_theme.dart';

class ShimmerLoader extends StatelessWidget {
  const ShimmerLoader({
    super.key,
    required this.boxShape,
    required this.size,
    this.borderRadius,
  });
  final BoxShape boxShape;
  final Size size;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: kPrimaryColor,
      highlightColor: kShimmerColor,
      child: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          shape: boxShape,
          borderRadius: borderRadius,
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
