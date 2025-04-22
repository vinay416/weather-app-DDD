import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app_ddd/core/assets_const.dart';
import 'package:weather_app_ddd/presentation/aqi/widgets/retry_button.dart';

class AqiFailedState extends StatelessWidget {
  const AqiFailedState({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(AssetsConst.kServerErrorSvg),
          Text(
            "Server error!\nPlease try again later.",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox.shrink(),
          RetryButton(),
        ],
      ),
    );
  }
}
