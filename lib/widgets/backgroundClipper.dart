import 'package:flutter/material.dart';

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height / 2);
    var controllPoint = Offset(100, size.height);
    var newControllPoint = Offset(size.height / 2, size.height);
    var endPoint = Offset(size.width / 2, size.height);
    var newEndPoint = Offset(size.width, size.height / 2);
    path.quadraticBezierTo(controllPoint.dx, controllPoint.dy, endPoint.dx, endPoint.dy);
    // path.lineTo(size.width, size.height);
    path.quadraticBezierTo(newControllPoint.dx, newControllPoint.dy, newEndPoint.dx, newEndPoint.dy);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
