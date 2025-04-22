import 'package:flutter/cupertino.dart';

class AqiCalculator {
  final List<double> pm25Breakpoints = [
    0.0,
    30.0,
    60.0,
    90.0,
    120.0,
    250.0,
    500.0,
  ];

  final List<int> aqiBreakpoints = [0, 50, 100, 200, 300, 400, 500];

  int calculateAqi(double pm25) {
    if (pm25 < 0) {
      throw ArgumentError('PM2.5 value cannot be negative');
    }

    for (int i = 0; i < pm25Breakpoints.length - 1; i++) {
      if (pm25 >= pm25Breakpoints[i] && pm25 <= pm25Breakpoints[i + 1]) {
        return _interpolate(
          pm25,
          pm25Breakpoints[i],
          pm25Breakpoints[i + 1],
          aqiBreakpoints[i],
          aqiBreakpoints[i + 1],
        );
      }
    }

    return 500; // Beyond index, categorized as hazardous
  }

  int _interpolate(double c, double cLow, double cHigh, int iLow, int iHigh) {
    return ((iHigh - iLow) / (cHigh - cLow) * (c - cLow) + iLow).round();
  }

  String aqiStatus(int aqi) {
    switch (aqi) {
      case 1:
        return "Good";
      case 2:
        return "Fair";
      case 3:
        return "Moderate";
      case 4:
        return "Poor";
      case 5:
        return "Very Poor";
      default:
        return "Error";
    }
  }

  Color aqiStatusColor(int index) {
    // Possible index: 1, 2, 3, 4, 5. Where 1 = Good, 2 = Fair, 3 = Moderate, 4 = Poor, 5 = Very Poor.
    switch (index) {
      case 1:
        return Color(0xFF53A593);
      case 2:
        return Color(0xFFABDC9E);
      case 3:
        return Color(0xFFf2d272);
      case 4:
        return Color(0xFF447AB8);
      case 5:
        return Color(0xFF8c74b3);
      default:
        return Color(0xFF9F86C0);
    }
  }

  String formatPollutantName(String pollutant) {
    return pollutant.replaceAll("_", ".").toUpperCase();
  }
}
