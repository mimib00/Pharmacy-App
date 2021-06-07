import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pharmacy_app/utils/color.dart';
import 'package:pharmacy_app/widgets/comment_input.dart';
import 'package:pharmacy_app/widgets/custom_button_1.dart';
import 'package:pharmacy_app/widgets/custom_button_2.dart';
import 'package:pharmacy_app/widgets/drawer.dart';

class PaperScan extends StatelessWidget {
  const PaperScan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      body: Column(
        children: [
          AppBar(
            backgroundColor: kPrimaryColor,
            elevation: 0,
          ),
          Container(
            height: 50,
            color: kPrimaryColor,
            width: double.infinity,
            child: Center(
              child: Text(
                'MY PRESCRIPTION',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 26),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'choose the photo of your prescription',
              style: TextStyle(
                color: kGreenColor,
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton1(
                iconData: FontAwesomeIcons.camera,
                title: 'Take Picture',
              ),
              CustomButton1(
                iconData: Icons.photo_library,
                title: 'Picture Gallery',
              ),
            ],
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1, vertical: 10),
              color: Colors.grey,
              child: Center(
                child: Icon(
                  Icons.no_photography_rounded,
                  size: 50,
                ),
              ),
            ),
          ),
          CommentInput(),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1,
              ),
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.phoneSquareAlt,
                    color: mainTeal,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'For inquiries, you can contact us',
                    style: TextStyle(color: mainTeal, fontSize: 18, fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: CustomButton2(
              onTap: () {},
              title: 'Submit',
            ),
          ),
          SizedBox(height: 15)
        ],
      ),
    );
  }
}
