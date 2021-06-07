import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pharmacy_app/utils/color.dart';
import 'package:pharmacy_app/widgets/custom_search_input.dart';

class SearchPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            color: kPrimaryColor,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(45)),
              child: Row(
                children: [
                  Expanded(
                    child: CustomSearchInput(
                      controller: _controller,
                      onChanged: (value) {},
                      hintText: 'Search For Medcine...',
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: IconButton(
                      onPressed: () {},
                      icon: FaIcon(
                        FontAwesomeIcons.search,
                        size: 35,
                        color: mainTeal,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*child: Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(45),
                  topLeft: Radius.circular(45),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 150,
                    child: TextField(
                      autofocus: true,
                      controller: _controller,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        isDense: true,
                        isCollapsed: true,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width * 0.2,
                    color: Colors.amber,
                  ),
                ],
              ),
            ),*/
