import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:pharmacy_app/provider/appData.dart';
import 'package:pharmacy_app/provider/orderData.dart';
import 'package:pharmacy_app/utils/color.dart';
import 'package:pharmacy_app/widgets/custom_button_2.dart';
import 'package:provider/provider.dart';

class OrderStep extends StatefulWidget {
  @override
  _OrderStepState createState() => _OrderStepState();
}

class _OrderStepState extends State<OrderStep> {
  String _payment = "Cash on Delivery";

  List<String> _paymentTypes = [
    "Cash on Delivery",
    "Baridi Mob",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .69,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(
              'CHOOSE A PAYMENT METHOD',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            color: Colors.grey[300],
            child: RadioGroup<String>.builder(
              groupValue: _payment,
              onChanged: (value) {
                print(value);
                setState(() {
                  _payment = value!;
                });
              },
              items: _paymentTypes,
              itemBuilder: (item) => RadioButtonBuilder(item),
            ),
          ),
          _payment == "Baridi Mob"
              ? Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(
                        thickness: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        child: Text(
                          'PHARMACY RIP',
                          style: TextStyle(color: mainTeal, fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(color: kGreenColor.withOpacity(.5), borderRadius: BorderRadius.circular(5)),
                        width: double.infinity,
                        alignment: Alignment.centerLeft,
                        height: 40,
                        child: Text(
                          '007999991234567890125',
                          style: TextStyle(color: Colors.blueGrey, fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                )
              : Container(),
          Spacer(),
          Column(
            children: [
              Divider(
                thickness: 2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Subtotal',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${context.read<AppData>().totalPrice} DA",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Delivery fee',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "500 DA",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${context.read<AppData>().totalPrice + 500} DA",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: CustomButton2(
                  onTap: () {
                    Provider.of<OrderData>(context, listen: false).makeOrder(_payment);
                  },
                  title: 'Order',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
