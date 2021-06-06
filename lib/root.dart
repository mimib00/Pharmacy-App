import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pharmacy_app/provider/appData.dart';
import 'package:pharmacy_app/utils/color.dart';
import 'package:pharmacy_app/views/carte.dart';
import 'package:pharmacy_app/views/home.dart';
import 'package:pharmacy_app/views/profile.dart';
import 'package:pharmacy_app/views/scan.dart';
import 'package:pharmacy_app/views/search.dart';
import 'package:provider/provider.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  List<Widget> screens = [
    HomePage(),
    SearchPage(),
    ProfilePage(),
    PaperScan(),
    ShoppingCarte()
  ];
  @override
  Widget build(BuildContext context) {
    int screenIndex = context.watch<AppData>().pageIndex;
    return SafeArea(
      child: Scaffold(
        body: screens[screenIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            context.read<AppData>().changePage(index);
          },
          type: BottomNavigationBarType.fixed,
          unselectedIconTheme: IconThemeData(color: Colors.grey, size: 30),
          selectedIconTheme: IconThemeData(color: kGreenColor, size: 30),
          currentIndex: screenIndex,
          unselectedFontSize: 0,
          selectedFontSize: 0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.home,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.search,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.userAlt,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.solidStickyNote,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.shoppingCart,
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
