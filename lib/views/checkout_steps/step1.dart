import 'package:flutter/material.dart';
import 'package:pharmacy_app/provider/appData.dart';
import 'package:pharmacy_app/utils/color.dart';
import 'package:provider/provider.dart';

class CarteStep extends StatefulWidget {
  @override
  _CarteStepState createState() => _CarteStepState();
}

class _CarteStepState extends State<CarteStep> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'YOUR ORDER',
              style: TextStyle(color: mainTeal, fontSize: 22),
            ),
          ),
          Divider(
            thickness: 1,
          ),
          SizedBox(height: 10),
          context.read<AppData>().carte[0],
          context.read<AppData>().carte[1],
        ],
      ),
    );
  }
}
