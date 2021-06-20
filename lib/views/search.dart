import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pharmacy_app/utils/color.dart';
import 'package:pharmacy_app/widgets/category_product_tile.dart';
import 'package:pharmacy_app/widgets/custom_search_input.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();

  var snapshot;

  // Widget searchList() {
  //   return snapshot != null
  //       ? ListView.builder(
  //           itemCount: snapshot!.docs.length,
  //           itemBuilder: (context, index) {
  //             return ProductTile(
  //               title: snapshot!.docs[index].data()['title'],
  //               imageUrl: snapshot!.docs[index].data()['imageUrl'],
  //               description: snapshot!.docs[index].data()['description'],
  //               price: snapshot!.docs[index].data()['price'],
  //               inStock: snapshot!.docs[index].data()['inStock'],
  //             );
  //           },
  //         )
  //       : Container();
  // }

  Widget searchList() {
    return snapshot != null
        ? ListView.builder(
            itemCount: snapshot!.docs.length,
            itemBuilder: (context, index) {
              return ProductTile(
                title: snapshot!.docs[index].data()['name'],
                imageUrl: snapshot!.docs[index].data()['imageUrl'],
                description: snapshot!.docs[index].data()['description'],
                price: double.parse(snapshot!.docs[index].data()['price'].toString()),
                inStock: snapshot!.docs[index].data()['inStock'],
              );
            },
          )
        : Container();
  }

  initSearch() async {
    var tempSnap = await FirebaseFirestore.instance.collection("Products").where("name", isEqualTo: _controller.text.trim()).get();
    print("DATA: ${tempSnap.docs[0].data()}");
    setState(() {
      snapshot = tempSnap;
    });
  }

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
                      onPressed: initSearch,
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
          Expanded(child: searchList())
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
