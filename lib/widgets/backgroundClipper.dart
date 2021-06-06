import 'package:flutter/material.dart';
import 'package:pharmacy_app/utils/color.dart';

class BackgroundPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    var paint = Paint();

    path.lineTo(0, size.height * 0.75);
    path.quadraticBezierTo(size.width / 2, size.height * .9, size.width, size.height * .75);
    path.lineTo(size.width, 0);
    path.close();
    paint.color = kPrimaryColor;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
