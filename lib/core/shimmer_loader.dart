import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather_app_ddd/theme/app_theme.dart';

class ShimmerLoader extends StatelessWidget {
  const ShimmerLoader({
    super.key,
    required this.boxShape,
    required this.size,
    this.borderRadius,
    this.child,
  });
  final BoxShape boxShape;
  final Size size;
  final BorderRadiusGeometry? borderRadius;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: Duration(seconds: 2),
      baseColor: kBaseShimmerColor,
      highlightColor: const Color.fromARGB(93, 189, 189, 189),
      child:
          child ??
          Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
              shape: boxShape,
              borderRadius: borderRadius,
              color: kBaseShimmerColor,
            ),
          ),
    );
  }
}
