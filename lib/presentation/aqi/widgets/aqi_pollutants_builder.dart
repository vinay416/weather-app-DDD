import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app_ddd/core/assets_const.dart';
import 'package:weather_app_ddd/theme/app_theme.dart';

import '../../../application/weather/aqi/aqi_bloc.dart';
import '../utils/aqi_colors_const.dart';

class AqiPollutantsBuilder extends StatelessWidget {
  const AqiPollutantsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
            child: Column(
              children: [
                Text("Pollutants", style: TextStyle(fontSize: 30)),
                _buildList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ListView _buildList() {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final color = kAQIPolluntantsColors[index];
        return _buildPollutant(color, context);
      },
      separatorBuilder: (context, index) => SizedBox(height: 5),
      itemCount: 8,
    );
  }

  Widget _buildPollutant(Color color, BuildContext context) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {
          context.read<AQIBloc>().add(ShowPollutantInfo("co"));
        },
        borderRadius: BorderRadius.circular(12),
        highlightColor: kSplashColor,
        child: Stack(children: [_buildCloudBG(), _buildDetails()]),
      ),
    );
  }

  Container _buildDetails() {
    return Container(
      width: double.infinity,
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "CO",
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            spacing: 10,
            children: [
              _buildUgM3Value(),
              Icon(Icons.info_outline, color: kPrimaryColor),
            ],
          ),
        ],
      ),
    );
  }

  Opacity _buildCloudBG() {
    return Opacity(
      opacity: 0.4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Transform.scale(
          scale: 6.5,
          child: LottieBuilder.asset(
            AssetsConst.kCloudGrey,
            animate: false,
            height: 80,
            width: double.infinity,
          ),
        ),
      ),
    );
  }

  Widget _buildUgM3Value() {
    return RichText(
      text: TextSpan(
        text: "12.0",
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: kPrimaryColor,
        ),
        children: [
          TextSpan(text: " "),
          TextSpan(text: "μg/m", style: TextStyle(fontSize: 18)),
          WidgetSpan(
            child: Transform.translate(
              offset: Offset(0, -3),
              child: Text(
                "3",
                style: TextStyle(
                  fontSize: 16,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
