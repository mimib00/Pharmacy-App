import 'package:flutter/material.dart';
import 'package:pharmacy_app/provider/appData.dart';
import 'package:pharmacy_app/utils/color.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ProductTile extends StatelessWidget {
  String title;
  String imageUrl;
  String description;
  double price;
  bool inStock;

  ProductTile({
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.price,
    required this.inStock,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 120,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * .65,
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 18, color: mainTeal, fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    width: 250,
                    height: 50,
                    child: Text(
                      description,
                      softWrap: true,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.65,
                    padding: const EdgeInsets.only(top: 10, left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          price.toString() + " DA",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Spacer(),
                        OutlinedButton(
                          child: Text(
                            'See More',
                            style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
                          ),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: kPrimaryColor, width: 2),
                          ),
                          onPressed: () {
                            print("clicked");
                          },
                        ),
                        IconButton(
                          onPressed: () {
                            Map<String, dynamic> data = {
                              "title": title,
                              "description": description,
                              "price": price,
                              "imageUrl": imageUrl,
                              "inStock": inStock,
                            };

                            Provider.of<AppData>(context, listen: false).addToCart(data);
                          },
                          icon: Icon(
                            Icons.add_shopping_cart_rounded,
                            color: mainTeal,
                            size: 30,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
          Divider(
            color: darkBlue,
          )
        ],
      ),
    );
  }
}
