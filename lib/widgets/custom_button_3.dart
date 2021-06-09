import 'package:flutter/material.dart';
import 'package:pharmacy_app/utils/color.dart';

class CustomButton3 extends StatelessWidget {
  final String? title;
  final IconData? iconData;
  final Function()? onTap;

  const CustomButton3({this.title, this.iconData, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      child: Container(
        height: 50,
        width: 150,
        padding: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: Color(0xffC6C7C6),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            title!,
            style: TextStyle(
              color: Colors.blue[700],
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
