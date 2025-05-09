import 'package:flutter/material.dart';
import 'package:weather_app_ddd/domain/weather/aqi_entity.dart';
import 'package:weather_app_ddd/presentation/aqi/widgets/aqi_meter_painter.dart';
import 'package:weather_app_ddd/theme/app_theme.dart';

import '../../core/weather/aqi_calculator.dart';

class AqiMeter extends StatelessWidget {
  const AqiMeter({super.key, required this.aqiEntity});
  final AqiEntity aqiEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 290,
      decoration: BoxDecoration(shape: BoxShape.rectangle),
      child: CustomPaint(painter: AqiMeterPainter(), child: _buildStatus()),
    );
  }

  Widget _buildStatus() {
    final aqiCal = AqiCalculator();
    final aqiVal = aqiCal.calculateAqi(aqiEntity.pm2_5);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      spacing: 5,
      children: [
        Transform.translate(
          offset: Offset(0, 150),
          child: Text(
            aqiVal.toString(),
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400),
          ),
        ),
        Text(
          aqiCal.aqiStatus(aqiVal),
          style: TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.bold,
            color: aqiCal.aqiStatusColor(aqiVal),
          ),
        ),
        RichText(
          text: TextSpan(
            text: aqiEntity.pm2_5.toString(),
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            children: [
              TextSpan(text: " "),
              TextSpan(text: "μg/m", style: TextStyle(fontSize: 16)),
              WidgetSpan(
                child: Transform.translate(
                  offset: Offset(0, -3),
                  child: Text(
                    "3",
                    style: TextStyle(
                      fontSize: 16,
                      color: kPrimaryTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
