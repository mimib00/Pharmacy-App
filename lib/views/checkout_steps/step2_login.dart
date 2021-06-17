import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy_app/provider/appData.dart';
import 'package:pharmacy_app/provider/orderData.dart';
import 'package:pharmacy_app/utils/color.dart';
import 'package:pharmacy_app/views/checkout_steps/step2_register.dart';
import 'package:pharmacy_app/widgets/backgroundClipper.dart';
import 'package:pharmacy_app/widgets/custom_button_3.dart';
import 'package:provider/provider.dart';

class AuthenticationStep extends StatefulWidget {
  @override
  _AuthenticationStepState createState() => _AuthenticationStepState();
}

class _AuthenticationStepState extends State<AuthenticationStep> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  void loginClient() async {
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email.text, password: _password.text);

    if (userCredential.user != null) {
      Provider.of<OrderData>(context, listen: false).setUser(userCredential.user!);

      context.read<AppData>().changeCheckoutStep(context.read<AppData>().checkoutStep + 1);
      setState(() {});
    }

    print("USER: ${Provider.of<OrderData>(context, listen: false).user!.uid}");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .69,
      width: size.width,
      child: CustomPaint(
        painter: BackgroundPaint(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 4),
              child: Text(
                'LOGIN',
                style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold, letterSpacing: 3),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 8),
              child: Text(
                'Login to your account',
                style: TextStyle(color: darkBlue, fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _email,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: mainTeal, width: 3)),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 3)),
                        icon: Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.white54),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextFormField(
                      controller: _password,
                      obscureText: true,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: mainTeal, width: 3)),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 3)),
                        icon: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.white54),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: TextStyle(color: darkBlue, fontSize: 18),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => Register()));
                    },
                    child: Text(
                      'REGISTER',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            CustomButton3(
              onTap: loginClient,
              title: 'LOGIN',
            ),
            Expanded(
              child: SvgPicture.asset('assets/images/mobile login.svg'),
            )
          ],
        ),
      ),
    );
  }
}
