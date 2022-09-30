import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui' as ui show Gradient;

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint myPaint = Paint()
      ..strokeWidth = 3.w
      ..style = PaintingStyle.stroke
      ..shader = ui.Gradient.linear(const Offset(0, 0), const Offset(1, 1), [
        const Color(0xFFA60F93),
        const Color(0xFFD91A46),
      ]);

    canvas.drawCircle(Offset(27.w, 27.w), 31.w, myPaint);
  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) {
    return false;
  }
}
