import 'package:flutter/material.dart';
import 'package:pharmacy_app/utils/color.dart';
import 'package:pharmacy_app/widgets/qty_button.dart';

// ignore: must_be_immutable
class CarteMedcineTile extends StatefulWidget {
  final String? title;
  final String? imageUrl;
  final String? description;
  final String? type;
  final bool inStock;
  int qty;

  CarteMedcineTile({
    this.type,
    this.title,
    this.imageUrl,
    this.description,
    this.inStock = true,
    this.qty = 1,
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
          )
        ],
      ),
    );
  }
}
