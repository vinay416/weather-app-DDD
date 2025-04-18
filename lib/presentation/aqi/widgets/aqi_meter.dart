import 'package:flutter/material.dart';
import 'package:weather_app_ddd/presentation/aqi/widgets/aqi_meter_painter.dart';
import 'package:weather_app_ddd/theme/app_theme.dart';

class AqiMeter extends StatelessWidget {
  const AqiMeter({super.key});

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text("Good", style: TextStyle(fontSize: 50)),
        RichText(
          text: TextSpan(
            text: "12.0",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            children: [
              TextSpan(text: " "),
              TextSpan(text: "μg/m", style: TextStyle(fontSize: 14)),
              WidgetSpan(
                child: Transform.translate(
                  offset: Offset(0, -3),
                  child: Text(
                    "3",
                    style: TextStyle(fontSize: 12, color: kPrimaryTextColor),
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
