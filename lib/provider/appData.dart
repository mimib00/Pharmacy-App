import 'package:flutter/cupertino.dart';
import 'package:pharmacy_app/widgets/cart_medcine_tile.dart';

class AppData with ChangeNotifier {
  int _registerIndex = 0;
  int get registerIndex => _registerIndex;

  int _pageIndex = 0;
  int get pageIndex => _pageIndex;

  int _checkoutStep = 0;
  int get checkoutStep => _checkoutStep;

  List _carte = [];
  List get carte => _carte;

  double _totalPrice = 0;
  double get totalPrice => _totalPrice;

  void addToCart(Map<String, dynamic> productData) {
    print(productData['title']);
    _carte.add(
      CartMedcineTile(
        title: productData['title'],
        description: productData['description'],
        inStock: productData['inStock'],
        imageUrl: productData['imageUrl'],
        price: productData['price'],
      ),
    );
  }

  void nextRegisterPage() {
    _registerIndex = 1;
    notifyListeners();
  }

  void restIndex() {
    _registerIndex = 0;
  }

  void changePage(int index) {
    _pageIndex = index;
    notifyListeners();
  }

  void changeCheckoutStep([int index = -1]) {
    if (_checkoutStep >= 3) {
      return;
    }
    if (index >= 0) {
      _checkoutStep = index;
      notifyListeners();
      return;
    }
    _checkoutStep += 1;
    notifyListeners();
  }

  // void updateTotalPrice() {}

  void getTotalPrice() {
    double itemPrice = 0;
    _carte.forEach((element) {
      itemPrice += element.price * element.qty;
      print("PRICE: $itemPrice");
    });
    _totalPrice = itemPrice;
  }
}
