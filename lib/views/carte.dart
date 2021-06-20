import 'package:flutter/material.dart';
import 'package:pharmacy_app/widgets/checkout.dart';

class ShoppingCarte extends StatelessWidget {
  const ShoppingCarte({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Checkout()
          ],
        ),
      ),
    );
  }
}
