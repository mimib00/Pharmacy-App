import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pharmacy_app/utils/color.dart';

// ignore: must_be_immutable
class CarteMedcineTile extends StatefulWidget {
  final String? title;
  final String? imageUrl;
  final String? description;
  final String? type;
  final bool inStock;
  final double? price;
  bool isFavorite;
  int qty;

  CarteMedcineTile({
    this.type,
    this.title,
    this.imageUrl,
    this.description,
    this.inStock = true,
    this.qty = 1,
    this.isFavorite = false,
    this.price,
  });

  @override
  _CarteMedcineTileState createState() => _CarteMedcineTileState();
}

class _CarteMedcineTileState extends State<CarteMedcineTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title!,
            style: TextStyle(fontSize: 18, color: kPrimaryColor, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Container(
                width: 150,
                child: Image.asset(
                  widget.imageUrl!,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(width: 10),
              Container(
                width: 180,
                height: 80,
                child: Text(
                  widget.description!,
                  softWrap: true,
                ),
              ),
            ],
          ),
          Divider(thickness: 1),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //Like Button
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    widget.isFavorite ? Icons.favorite : Icons.favorite_outline,
                    size: 30,
                    color: widget.isFavorite ? Colors.red : kPrimaryColor,
                  ),
                ),
                VerticalDivider(
                  thickness: 1,
                ),
                //Remove button
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(FontAwesomeIcons.trash),
                      SizedBox(width: 5),
                      Text(
                        "Remove",
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),

                Spacer(),
                //In Stock?
                widget.inStock
                    ? Text(
                        "In Stock",
                        style: TextStyle(fontSize: 12, color: kPrimaryColor, fontWeight: FontWeight.w500),
                      )
                    : Text(
                        "Out Stock",
                        style: TextStyle(fontSize: 12, color: Colors.red, fontWeight: FontWeight.w500),
                      ),
                SizedBox(width: 5),
                //Incrase/Decrase counter
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (widget.qty == 0) {
                          return;
                        }
                        setState(() {
                          widget.qty -= 1;
                        });
                      },
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(color: kPrimaryColor, borderRadius: BorderRadius.circular(5)),
                        child: Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(widget.qty.toString()),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.qty += 1;
                        });
                      },
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(color: kPrimaryColor, borderRadius: BorderRadius.circular(5)),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(thickness: 1),
        ],
      ),
    );
  }
}
