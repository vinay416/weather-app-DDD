import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app_ddd/core/assets_const.dart';
import 'package:weather_app_ddd/presentation/aqi/widgets/aqi_meter.dart';
import 'package:weather_app_ddd/presentation/aqi/widgets/aqi_pollutants_builder.dart';

class AqiLoaded extends StatefulWidget {
  const AqiLoaded({super.key});

  @override
  State<AqiLoaded> createState() => _AqiLoadedState();
}

class _AqiLoadedState extends State<AqiLoaded>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(vsync: this);
    loadClouds();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void loadClouds() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Durations.short1, () {
        controller.forward(from: 0.5);
        controller.addStatusListener((status) {
          if (status.isCompleted) controller.repeat();
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform.scale(
          scale: 1.5,
          child: LottieBuilder.asset(AssetsConst.kCloudPinkLottie),
        ),
        Transform.scale(
          scale: 1.5,
          child: LottieBuilder.asset(
            AssetsConst.kCloudGreyLottie,
            height: 300,
            controller: controller,
            onLoaded: (p0) {
              controller.duration = p0.duration;
            },
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 80,
          children: [SizedBox(), AqiMeter(), AqiPollutantsBuilder()],
        ),
      ],
    );
  }
}
