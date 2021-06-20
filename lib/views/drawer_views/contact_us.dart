import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy_app/utils/color.dart';

// ignore: must_be_immutable
class ContactUs extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _message = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                // Header
                Container(
                  width: double.infinity,
                  color: kPrimaryColor,
                  padding: EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      Text(
                        'CONTACT US',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                          letterSpacing: 7,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .7,
                        child: Text(
                          'Have a question or just want to  say Hi?drop us a message',
                          style: TextStyle(
                            color: darkBlue,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 20),
                      SvgPicture.asset(
                        'assets/images/contact_us.svg',
                        fit: BoxFit.fill,
                        height: 200,
                      )
                    ],
                  ),
                ),
                // Body
                Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      margin: const EdgeInsets.only(left: 50, top: 50, right: 50),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      decoration: BoxDecoration(border: Border.all(color: kPrimaryColor, width: 2)),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _email,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: mainTeal, width: 3)),
                                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black, width: 3)),
                                icon: Icon(
                                  Icons.email,
                                ),
                                hintText: "Email",
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            TextFormField(
                              controller: _phone,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: mainTeal, width: 3)),
                                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black, width: 3)),
                                icon: Icon(
                                  Icons.phone,
                                ),
                                hintText: "Phone",
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            TextFormField(
                              controller: _message,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: mainTeal, width: 3)),
                                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black, width: 3)),
                                icon: Icon(
                                  Icons.message_rounded,
                                ),
                                hintText: "Message",
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(45),
                  ),
                  child: IconButton(
                    iconSize: 40,
                    onPressed: () {},
                    icon: Icon(Icons.send),
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
