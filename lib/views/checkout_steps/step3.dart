import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:pharmacy_app/provider/appData.dart';
import 'package:pharmacy_app/provider/orderData.dart';
import 'package:pharmacy_app/utils/color.dart';
import 'package:pharmacy_app/widgets/custom_button_2.dart';
import 'package:pharmacy_app/widgets/custom_button_3.dart';
import 'package:provider/provider.dart';

class DeliveryStep extends StatefulWidget {
  @override
  _DeliveryStepState createState() => _DeliveryStepState();
}

class _DeliveryStepState extends State<DeliveryStep> {
  String _delivery = "Standard";

  List<String> _deliveryTypes = [
    "Standard delivery: 500 DA",
    "Home delivery",
    "Deliver to another address"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(
              'ADDRESS DETAILS',
              style: TextStyle(color: mainTeal, fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          Divider(
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Text(
              "${Provider.of<OrderData>(context).userData!.firstName} ${Provider.of<OrderData>(context).userData!.lastName}",
              style: TextStyle(color: darkBlue, fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "${Provider.of<OrderData>(context).userData!.address}",
              style: TextStyle(color: darkBlue, fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "${Provider.of<OrderData>(context).userData!.wilaya}",
              style: TextStyle(color: darkBlue, fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "${Provider.of<OrderData>(context).userData!.phone}",
              style: TextStyle(color: darkBlue, fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          Divider(
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(
              'DELIVERY METHOD',
              style: TextStyle(color: mainTeal, fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          RadioGroup<String>.builder(
            groupValue: _delivery,
            onChanged: (value) {
              setState(() => _delivery = value!);
            },
            items: _deliveryTypes,
            itemBuilder: (item) => RadioButtonBuilder(item),
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
                context.read<AppData>().changeCheckoutStep();
              },
              title: 'Go to payment',
            ),
          ),
        ],
      ),
    );
  }
}
