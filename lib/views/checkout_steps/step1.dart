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
  void initState() {
    super.initState();
    context.read<AppData>().getTotalPrice();
  }

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
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: context.read<AppData>().carte.length,
                    itemBuilder: (context, index) {
                      return context.read<AppData>().carte[index];
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Row(
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        context.read<AppData>().totalPrice.toString(),
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
