import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pharmacy_app/provider/orderData.dart';
import 'package:pharmacy_app/utils/color.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.81,
          child: Stack(
            children: [
              Container(
                color: kPrimaryColor,
                height: MediaQuery.of(context).size.height * .32,
                padding: EdgeInsets.only(top: 20),
                alignment: Alignment.topCenter,
                child: Text(
                  'PROFILE',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    letterSpacing: 7,
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * .1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/cuate.svg',
                        fit: BoxFit.fill,
                        height: 250,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            child: Row(
                              children: [
                                Icon(
                                  FontAwesomeIcons.userAlt,
                                  color: mainTeal,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'First Name: ',
                                  style: TextStyle(color: darkBlue, fontSize: 20),
                                ),
                                Text(
                                  "${Provider.of<OrderData>(context).userData!.firstName}",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            child: Row(
                              children: [
                                Icon(
                                  FontAwesomeIcons.userAlt,
                                  color: mainTeal,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Last Name: ',
                                  style: TextStyle(color: darkBlue, fontSize: 20),
                                ),
                                Text(
                                  "${Provider.of<OrderData>(context).userData!.lastName}",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                          // Container(
                          //   width: 100,
                          //   child: Divider(),
                          // ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            child: Row(
                              children: [
                                Icon(
                                  FontAwesomeIcons.phoneAlt,
                                  color: mainTeal,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Phone: ',
                                  style: TextStyle(color: darkBlue, fontSize: 20),
                                ),
                                Text(
                                  "${Provider.of<OrderData>(context).userData!.phone}",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.email,
                                  color: mainTeal,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Email: ',
                                  style: TextStyle(color: darkBlue, fontSize: 20),
                                ),
                                Text(
                                  "${Provider.of<OrderData>(context).userData!.email}",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            child: Row(
                              children: [
                                Icon(
                                  FontAwesomeIcons.solidAddressBook,
                                  color: mainTeal,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Full Address: ',
                                  style: TextStyle(color: darkBlue, fontSize: 20),
                                ),
                                Text(
                                  "${Provider.of<OrderData>(context).userData!.address}, ${Provider.of<OrderData>(context).userData!.wilaya}",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 30,
                left: MediaQuery.of(context).size.width * .35,
                child: OutlinedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Edit Profile',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(width: 5),
                      Icon(
                        FontAwesomeIcons.edit,
                        color: Colors.white,
                        size: 20,
                      )
                    ],
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(mainTeal),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
/**/
