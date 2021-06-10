import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:pharmacy_app/provider/appData.dart';
import 'package:pharmacy_app/utils/color.dart';
import 'package:pharmacy_app/widgets/custom_button_3.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  List pages = [
    FirstPage(),
    SecondPage()
  ];

  @override
  void initState() {
    super.initState();
    context.read<AppData>().restIndex();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kPrimaryColor,
        ),
        body: SingleChildScrollView(
          child: pages[context.watch<AppData>().registerIndex],
        ),
      ),
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _verticalGroupValue = "Gender";

  List<String> _status = [
    "Men",
    "Woman"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              'REGISTER',
              style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold, letterSpacing: 3),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 8),
            child: Text(
              'Create an account, it\'s free',
              style: TextStyle(color: darkBlue, fontSize: 18),
            ),
          ),
          SizedBox(height: 50),
          Row(
            children: [
              Text(
                'Gender:',
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 3),
              ),
              RadioGroup<String>.builder(
                groupValue: _verticalGroupValue,
                onChanged: (value) {
                  setState(
                    () => _verticalGroupValue = value!,
                  );
                  print(_verticalGroupValue);
                },
                items: _status,
                itemBuilder: (item) => RadioButtonBuilder(
                  item,
                ),
                activeColor: Colors.white,
                direction: Axis.horizontal,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 50),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: mainTeal, width: 3)),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 3)),
                      icon: Icon(
                        Icons.person_outline,
                        color: Colors.white,
                      ),
                      hintText: "First Name",
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: mainTeal, width: 3)),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 3)),
                      icon: Icon(
                        Icons.person_outline,
                        color: Colors.white,
                      ),
                      hintText: "Last Name",
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: mainTeal, width: 3)),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 3)),
                      icon: Icon(
                        Icons.email_outlined,
                        color: Colors.white,
                      ),
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: mainTeal, width: 3)),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 3)),
                      icon: Icon(
                        Icons.phone_android_outlined,
                        color: Colors.white,
                      ),
                      hintText: "Phone",
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: mainTeal, width: 3)),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 3)),
                      icon: Icon(
                        Icons.lock_outline,
                        color: Colors.white,
                      ),
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: mainTeal, width: 3)),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 3)),
                      icon: Icon(
                        Icons.lock_outline,
                        color: Colors.white,
                      ),
                      hintText: "Confirm Password",
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: CustomButton3(
              title: "Next",
              onTap: () {
                context.read<AppData>().nextRegisterPage();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _verticalGroup1Value = "Allergy";
  String _verticalGroup2Value = "Medics";

  bool checkboxValue = false;

  List<String> _status = [
    "Yes",
    "No"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              'REGISTER',
              style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold, letterSpacing: 3),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 8),
            child: Text(
              'Create an account, it\'s free',
              style: TextStyle(color: darkBlue, fontSize: 18),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 50),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: mainTeal, width: 3)),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 3)),
                      icon: Icon(
                        FontAwesomeIcons.mapPin,
                        color: Colors.white,
                      ),
                      hintText: "Wilaya",
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: mainTeal, width: 3)),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 3)),
                      icon: Icon(
                        Icons.location_pin,
                        color: Colors.white,
                      ),
                      hintText: "Address",
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
            child: Text(
              'Do you have a particular pathology and/or allergic history.',
              style: TextStyle(color: darkBlue, fontSize: 20),
            ),
          ),
          RadioGroup<String>.builder(
            groupValue: _verticalGroup1Value,
            horizontalAlignment: MainAxisAlignment.center,
            onChanged: (value) {
              setState(
                () => _verticalGroup1Value = value!,
              );
              print(_verticalGroup1Value);
            },
            items: _status,
            itemBuilder: (item) => RadioButtonBuilder(
              item,
            ),
            activeColor: Colors.white,
            direction: Axis.horizontal,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
              child: Text(
                'Do you take any medication.',
                style: TextStyle(color: darkBlue, fontSize: 20),
              ),
            ),
          ),
          RadioGroup<String>.builder(
            groupValue: _verticalGroup2Value,
            horizontalAlignment: MainAxisAlignment.center,
            onChanged: (value) {
              setState(
                () => _verticalGroup2Value = value!,
              );
              print(_verticalGroup2Value);
            },
            items: _status,
            itemBuilder: (item) => RadioButtonBuilder(
              item,
            ),
            activeColor: Colors.white,
            direction: Axis.horizontal,
          ),
          Row(
            children: [
              Checkbox(
                value: checkboxValue,
                onChanged: (value) {
                  setState(() {
                    checkboxValue = value!;
                  });
                },
                activeColor: Colors.white,
              ),
              Container(
                width: MediaQuery.of(context).size.width * .82,
                child: Text(
                  'I certify the accuracy of the information provided.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                  softWrap: true,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: CustomButton3(
              title: "Register",
              onTap: () {
                print({
                  "verticalGroup1Value": _verticalGroup1Value,
                  "verticalGroup2Value": _verticalGroup2Value,
                  "checkBox": checkboxValue
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
