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

// class BackgroundClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var path = Path();
//     path.lineTo(0, size.height - 100);
//     var controllPoint = Offset(100, size.height);
//     var newControllPoint = Offset(size.height / 2, size.height);
//     var endPoint = Offset(size.width / 2, size.height);
//     var newEndPoint = Offset(size.width, size.height / 2);
//     path.quadraticBezierTo(controllPoint.dx, controllPoint.dy, endPoint.dx, endPoint.dy);
//     path.lineTo(size.width, size.height / 2);
//     path.quadraticBezierTo(newControllPoint.dx, newControllPoint.dy, newEndPoint.dx, newEndPoint.dy);
//     path.lineTo(size.width, 0);

//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return true;
//   }
// }
