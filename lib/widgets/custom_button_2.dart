import 'package:flutter/material.dart';
import 'package:pharmacy_app/utils/color.dart';

class CustomButton2 extends StatelessWidget {
  final String? title;
  final IconData? iconData;
  final Function()? onTap;

  const CustomButton2({this.title, this.iconData, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      child: Container(
        height: 50,
        // width: 150,
        padding: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: mainTeal,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title!,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 10),
            Icon(
              iconData == null ? Icons.send : iconData,
              size: 25,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
