import 'dart:math';

import 'package:flutter/material.dart';

import '../utils/aqi_colors_const.dart';

class AqiMeterPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    List<Color> sectorColors = kAQIMeterColors;

    final double mainCircleDiameter = size.width;

    final arcsRect = Rect.fromLTWH(
      0,
      0,
      mainCircleDiameter,
      mainCircleDiameter,
    );

    final arcsRect2 = Rect.fromLTWH(
      30,
      30,
      mainCircleDiameter - 60,
      mainCircleDiameter - 60,
    );

    final Paint paint =
        Paint()
          ..isAntiAlias = true
          ..strokeWidth = 8.0
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round
          ..shader = LinearGradient(
            colors: sectorColors,
          ).createShader(arcsRect);

    final Paint paint2 =
        Paint()
          ..isAntiAlias = true
          ..strokeWidth = 30.0
          ..style = PaintingStyle.stroke
          ..shader = LinearGradient(
            // ignore: deprecated_member_use
            colors: sectorColors.map((e) => e.withOpacity(0.2)).toList(),
          ).createShader(arcsRect);

    final useCenter = false;

    final double sweepAngle = (3 * pi / 2) / sectorColors.length;
    double startAngle = (3 * pi) / 4;

    for (Color _ in sectorColors) {
      canvas.drawArc(arcsRect, startAngle, sweepAngle, useCenter, paint);
      canvas.drawArc(arcsRect2, startAngle, sweepAngle, useCenter, paint2);
      startAngle = startAngle + sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
