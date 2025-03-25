class AqiCalculator {
  final List<double> pm25Breakpoints = [
    0.0,
    12.0,
    35.4,
    55.4,
    150.4,
    250.4,
    500.4,
  ];
  final List<int> aqiBreakpoints = [0, 50, 100, 150, 200, 300, 500];

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

    return 500;
  }

  int _interpolate(double c, double cLow, double cHigh, int iLow, int iHigh) {
    return ((iHigh - iLow) / (cHigh - cLow) * (c - cLow) + iLow).round();
  }

  String aqiStatus(int index) {
    // Possible index: 1, 2, 3, 4, 5. Where 1 = Good, 2 = Fair, 3 = Moderate, 4 = Poor, 5 = Very Poor.
    switch (index) {
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
}
