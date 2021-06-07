import 'package:flutter/material.dart';
import 'package:pharmacy_app/utils/color.dart';

class CustomButton1 extends StatelessWidget {
  final IconData? iconData;
  final String? title;

  const CustomButton1({this.iconData, this.title});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      minWidth: 0,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      height: 0,
      onPressed: () {},
      child: Container(
        height: 80,
        width: 150,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: darkBlue, width: 1.5),
        ),
        child: Column(
          children: [
            Icon(
              iconData,
              size: 30,
              color: darkBlue,
            ),
            SizedBox(height: 5),
            Text(
              title!,
              style: TextStyle(color: darkBlue, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
