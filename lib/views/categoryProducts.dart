import 'package:flutter/material.dart';
import 'package:pharmacy_app/provider/storeData.dart';
import 'package:pharmacy_app/utils/color.dart';
import 'package:provider/provider.dart';

class CategoryProducts extends StatefulWidget {
  final String? categoryName;

  const CategoryProducts({
    required this.categoryName,
  });

  @override
  _CategoryProductsState createState() => _CategoryProductsState();
}

class _CategoryProductsState extends State<CategoryProducts> {
  @override
  void initState() {
    super.initState();
    Provider.of<StoreData>(context, listen: false).fetchCategoryProducts(widget.categoryName!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
      ),
      body: Container(
        child: Column(
          children: Provider.of<StoreData>(context).categoryProducts,
        ),
      ),
    );
  }
}
