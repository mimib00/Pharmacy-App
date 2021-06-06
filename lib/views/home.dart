import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              Text(
                'Welcome\nTo The\n Online Pharmacy',
                style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 100),
              Container(
                width: size.width,
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 50,
                decoration: BoxDecoration(color: mainTeal, borderRadius: BorderRadius.circular(45)),
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.search,
                      color: Colors.white70,
                    ),
                    SizedBox(width: 15),
                    Text(
                      'Search For Medcine',
                      style: TextStyle(color: Colors.white70, fontSize: 20, wordSpacing: 2, letterSpacing: 1.5),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SvgPicture.asset('assets/images/Pharmacist-cuate.svg'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
