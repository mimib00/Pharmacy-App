import 'package:flutter/material.dart';
import 'package:pharmacy_app/provider/appData.dart';
import 'package:pharmacy_app/utils/color.dart';
import 'package:provider/provider.dart';

class ProductTile extends StatelessWidget {
  final String? title;
  final String? imageUrl;
  final String? description;
  final double? price;
  final bool? inStock;

  const ProductTile({
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.price,
    required this.inStock,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            width: 120,
            child: Image.network(
              imageUrl!,
              fit: BoxFit.fill,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title!,
                style: TextStyle(fontSize: 18, color: mainTeal, fontWeight: FontWeight.w500),
              ),
              Container(
                width: 180,
                height: 50,
                child: Text(
                  description!,
                  softWrap: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price.toString() + " DA",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(width: 15),
                    OutlinedButton(
                      child: Text(
                        'See The Product',
                        style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: kPrimaryColor, width: 2),
                      ),
                      onPressed: () {},
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
    );
  }
}
