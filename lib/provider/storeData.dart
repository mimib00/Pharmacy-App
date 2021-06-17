import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_app/views/categoryProducts.dart';
import 'package:pharmacy_app/widgets/category_product_tile.dart';

class StoreData with ChangeNotifier {
  List<Widget> _categories = [];
  List<Widget> get categories => _categories;

  List<Widget> _categoryProducts = [];
  List<Widget> get categoryProducts => _categoryProducts;

  void fetchCategories(BuildContext context) async {
    _categories.clear();
    var snap = await FirebaseFirestore.instance.collection('Categories').get();
    snap.docs.forEach((element) {
      _categories.add(
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => CategoryProducts(categoryName: element.data()['name'])));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Text(
              element.data()['name'],
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.left,
            ),
          ),
        ),
      );
    });
  }

  void fetchCategoryProducts(String categoryName) async {
    _categoryProducts.clear();
    var snap = await FirebaseFirestore.instance.collection("Products").where("category", isEqualTo: categoryName).get();

    snap.docs.forEach((doc) {
      print(doc.data()['name']);
      _categoryProducts.add(
        ProductTile(
          title: doc.data()['name'],
          imageUrl: doc.data()['imageUrl'],
          description: doc.data()['description'],
          price: double.parse(doc.data()['price'].toString()),
          inStock: doc.data()['inStock'],
        ),
      );
    });

    notifyListeners();
  }
}
