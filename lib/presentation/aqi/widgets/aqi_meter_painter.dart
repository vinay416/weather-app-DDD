import 'dart:math';

import 'package:flutter/material.dart';

class AqiMeterPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    List<Color> sectorColors = [
      Color(0xFFfadbaa),
      Color(0xFFf2d272),
      Color(0xFFf6c99d),
      Color(0xFFf2c97d),
      Color(0xFFF3CA96),
      Color(0xFFedc044),
      Color(0xFFAFD99E),
      Color(0xFFA2D79B),
      Color(0xFFABDC9E),
      Color(0xFF85cb9d),
      Color(0xFF85cb9d),
      Color(0xFF53A593),
      Color(0xFF5DB394),
      Color(0xFF4C90A5),
      Color(0xFF447AB8),
      Color(0xFF4185B1),
      Color(0xFF447ac1),
      Color(0xFF4378C1),
      Color(0xFF756cba),
      Color(0xFF8c74b3),
      Color(0xFF9882BA),
      Color(0xFF9F86C0),
    ];

    // List<Color> sectorColors = [
    //   Color(0xFFA2D79B),
    //   Color(0xFF85cb9d),
    //   Color(0xFF85cb9d),
    //   Color(0xFFABDC9E),
    //   Color(0xFFfadbaa),
    //   Color(0xFFf2d272),
    //   Color(0xFFf6c99d),
    //   Color(0xFFf2c97d),
    //   Color(0xFFedc044),
    //   Color(0xFFed9c47),
    //   Color(0xFFea6523),
    //   Color(0xFFd15212),
    // ];

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
