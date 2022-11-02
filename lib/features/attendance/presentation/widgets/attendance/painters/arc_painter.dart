import 'dart:math';

import 'package:erp_employee_app/core/utils/math_utils.dart';
import 'package:flutter/material.dart';

class ArcPainter extends CustomPainter {
  final double _sweepAngle;

  final Color fillColor;
  final Color backgroundColor;
  final double radius;

  const ArcPainter({
    required double percentage,
    required this.fillColor,
    required this.backgroundColor,
    required this.radius,
  }) : _sweepAngle = percentage * 360;

  @override
  void paint(Canvas canvas, Size size) {
    Paint backgroundLinePaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = backgroundColor
      ..strokeWidth = 3;
    Paint fillPaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = fillColor
      ..strokeWidth = 3;
    // Paint fillPaint = paint..color = fillColor;

    Offset center = Offset(size.width / 2, size.width / 2);

    canvas.drawCircle(center, radius, backgroundLinePaint);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      MathUtils.toRadians(_sweepAngle),
      false,
      fillPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
