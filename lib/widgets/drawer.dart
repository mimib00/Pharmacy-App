import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pharmacy_app/utils/color.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Drawer(
        child: Container(
          color: Color(0xffDFE9EF),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'Menu',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  thickness: 2,
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.clipboardList,
                      size: 35,
                      color: mainTeal,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Categories",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  thickness: 2,
                  color: Colors.grey,
                ),
              ),
              ExpansionTile(
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.chat,
                      color: mainTeal,
                      size: 35,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Contact Us",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  thickness: 2,
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_pin,
                      size: 35,
                      color: mainTeal,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Location & Hours",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  thickness: 2,
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.settings,
                      size: 35,
                      color: mainTeal,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Settings",
                      style: TextStyle(
                        fontSize: 20,
                      ),
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
