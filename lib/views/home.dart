import 'package:flutter/material.dart';
import 'package:pharmacy_app/utils/color.dart';
import 'package:pharmacy_app/widgets/backgroundClipper.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: CustomPaint(
          painter: BackgroundPaint(),
        ),
      ),
    );
  }
}
