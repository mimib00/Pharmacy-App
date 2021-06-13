import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_app/provider/appData.dart';
import 'package:pharmacy_app/utils/color.dart';
import 'package:pharmacy_app/widgets/checkout.dart';
import 'package:pharmacy_app/widgets/drawer.dart';
import 'package:provider/provider.dart';

class ShoppingCarte extends StatelessWidget {
  const ShoppingCarte({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              backgroundColor: kPrimaryColor,
              elevation: 0,
            ),
            Checkout()
          ],
        ),
      ),
      floatingActionButton: FirebaseAuth.instance.currentUser != null
          ? context.watch<AppData>().checkoutStep != 1
              ? FloatingActionButton(
                  child: Icon(Icons.arrow_forward),
                  backgroundColor: kPrimaryColor,
                  onPressed: () {
                    context.read<AppData>().changeCheckoutStep();
                  },
                )
              : null
          : FloatingActionButton(
              child: Icon(Icons.arrow_forward),
              backgroundColor: kPrimaryColor,
              onPressed: () {
                context.read<AppData>().changeCheckoutStep();
              },
            ),
    );
  }
}

/*FirebaseAuth.instance.currentUser != null
      ? [
          CarteStep(),
          DeliveryStep(),
          Container(
            child: Center(
              child: Text('Step4'),
            ),
          ),
        ]
      : */
