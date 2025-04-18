import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app_ddd/core/assets_const.dart';
import 'package:weather_app_ddd/presentation/aqi/widgets/aqi_meter.dart';
import 'package:weather_app_ddd/presentation/aqi/widgets/aqi_pollutants_builder.dart';

class AqiLoaded extends StatelessWidget {
  const AqiLoaded({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        LottieBuilder.asset(AssetsConst.kCloudPink),
        LottieBuilder.asset(AssetsConst.kCloudGrey, height: 300),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 80,
          children: [SizedBox(), AqiMeter(), AqiPollutantsBuilder()],
        ),
      ],
    );
  }
}
