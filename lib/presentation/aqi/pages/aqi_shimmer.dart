import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app_ddd/core/assets_const.dart';
import 'package:weather_app_ddd/core/shimmer_loader.dart';

class AqiShimmer extends StatelessWidget {
  const AqiShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
            child: ShimmerLoader(
              boxShape: BoxShape.rectangle,
              size: Size.fromRadius(100),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 50,
              children: [
                SvgPicture.asset(AssetsConst.kLocationSvg, height: 300),
                LottieBuilder.asset(AssetsConst.kScannerLottie, height: 80),
                Text(
                  "Getting location...",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
