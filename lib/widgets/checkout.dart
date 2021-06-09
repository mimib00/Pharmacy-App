import 'package:flutter/material.dart';
import 'package:pharmacy_app/provider/appData.dart';
import 'package:pharmacy_app/utils/color.dart';
import 'package:pharmacy_app/views/checkout_steps/step1.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  List<Widget> pages = [
    CarteStep(),
    Container(
      child: Center(
        child: Text('Step2'),
      ),
    ),
    Container(
      child: Center(
        child: Text('Step3'),
      ),
    ),
    Container(
      child: Center(
        child: Text('Step4'),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Indicator
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 100,
          color: kPrimaryColor,
          child: StepProgressIndicator(
            onTap: (index) => () => context.read<AppData>().changeCheckoutStep(index),
            totalSteps: 4,
            currentStep: context.watch<AppData>().checkoutStep + 1,
            size: 50,
            selectedColor: mainTeal,
            unselectedColor: Color(0xffA5A6A5),
            customStep: (index, color, _) => color == mainTeal
                ? Container(
                    decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(60)),
                    child: Center(
                      child: Text(
                        "${index + 1}",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(60)),
                    child: Center(
                      child: Text(
                        "${index + 1}",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
          ),
        ),
        pages[context.watch<AppData>().checkoutStep]
      ],
    );
  }
}
