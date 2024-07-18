import 'dart:math';

import 'package:flutter/material.dart';

class DrawRingsArc extends CustomPainter {
  DrawRingsArc({this.rings = 4, this.gap = 10, this.color = Colors.yellow});

  final int rings;
  final int gap;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    //  Draw an outer Arc Circle.
    Rect rect = Rect.fromCenter(center: Offset.zero, width: size.width, height: size.height);
    double startAngle = 4.5 / 3 * pi;
    double sweepAngle = 1.6 * pi;
    bool useCenter = false;
    Paint paint = Paint();
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;
    paint.color = color;

    var center = sqrt((size.width) * (size.height)) / 2;
    int ringCount = rings;
    int gap = 10;

    while (ringCount > 0) {
      canvas.drawCircle(Offset.zero, center - (gap * ringCount), paint);
      ringCount--;
    }

    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
