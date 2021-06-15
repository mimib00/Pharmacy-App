import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy_app/utils/color.dart';

class LocationAndHours extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          elevation: 0,
        ),
        body: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              // Header
              Container(
                width: double.infinity,
                color: kPrimaryColor,
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Text(
                      'LOCATION & HOURS',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(height: 20),
                    SvgPicture.asset(
                      'assets/images/location_photo.svg',
                      fit: BoxFit.fill,
                      height: 200,
                    )
                  ],
                ),
              ),
              // Body
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_pin,
                            color: mainTeal,
                            size: 30,
                          ),
                          SizedBox(width: 15),
                          Text(
                            'N18, Djendel',
                            style: TextStyle(color: mainTeal, fontSize: 20, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        children: [
                          Icon(
                            Icons.phone,
                            color: mainTeal,
                            size: 30,
                          ),
                          SizedBox(width: 15),
                          Text(
                            '+213 27 54 10 46',
                            style: TextStyle(color: mainTeal, fontSize: 20, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        children: [
                          Icon(
                            Icons.timer_rounded,
                            color: mainTeal,
                            size: 30,
                          ),
                          SizedBox(width: 15),
                          Text(
                            'Sun-Sat: 8:00AM - 12:00PM',
                            style: TextStyle(color: mainTeal, fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 250,
                      child: Image.asset('assets/images/location.png'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
