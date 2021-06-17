import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pharmacy_app/utils/color.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool news = false;

  bool activty = false;

  bool opportunity = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Settings',
            style: TextStyle(letterSpacing: 3, fontSize: 24),
          ),
          backgroundColor: kPrimaryColor,
          elevation: 0,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Icon(
                      Icons.person,
                      size: 35,
                      color: mainTeal,
                    ),
                    Text(
                      'Account',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 2,
              ),
              MaterialButton(
                onPressed: () {},
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Change password',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
              MaterialButton(
                onPressed: () {},
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Privacy & Security',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
              MaterialButton(
                onPressed: () {},
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Language',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
              MaterialButton(
                onPressed: () {},
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Country',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Icon(
                      Icons.volume_up,
                      size: 35,
                      color: mainTeal,
                    ),
                    Text(
                      'Notifications',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 2,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'News For You',
                      style: TextStyle(fontSize: 20),
                    ),
                    CupertinoSwitch(
                      value: news,
                      onChanged: (value) {
                        setState(() {
                          news = value;
                        });
                      },
                      activeColor: mainTeal,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Account Activity',
                      style: TextStyle(fontSize: 20),
                    ),
                    CupertinoSwitch(
                      value: activty,
                      onChanged: (value) {
                        setState(() {
                          activty = value;
                        });
                      },
                      activeColor: mainTeal,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Opportunity',
                      style: TextStyle(fontSize: 20),
                    ),
                    CupertinoSwitch(
                      value: opportunity,
                      onChanged: (value) {
                        setState(() {
                          opportunity = value;
                        });
                      },
                      activeColor: mainTeal,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
