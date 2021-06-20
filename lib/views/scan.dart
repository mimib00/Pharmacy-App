import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pharmacy_app/utils/color.dart';
import 'package:pharmacy_app/widgets/comment_input.dart';
import 'package:pharmacy_app/widgets/custom_button_1.dart';
import 'package:pharmacy_app/widgets/custom_button_2.dart';

// ignore: must_be_immutable
class PaperScan extends StatefulWidget {
  @override
  _PaperScanState createState() => _PaperScanState();
}

class _PaperScanState extends State<PaperScan> {
  File? _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.815,
          child: Column(
            children: [
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
                    onTap: getImage,
                  ),
                  CustomButton1(
                    iconData: Icons.photo_library,
                    title: 'Picture Gallery',
                    onTap: pickImage,
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1, vertical: 10),
                  color: Colors.grey,
                  child: Center(
                    child: _image == null
                        ? Icon(
                            Icons.no_photography_rounded,
                            size: 50,
                          )
                        : Image.file(_image!),
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
        ),
      ),
    );
  }
}

/**/
