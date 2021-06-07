import 'package:flutter/cupertino.dart';

class AppData with ChangeNotifier {
  int _pageIndex = 0;
  int get pageIndex => _pageIndex;

  int _checkoutStep = 0;
  int get checkoutStep => _checkoutStep;

  void changePage(int index) {
    _pageIndex = index;
    notifyListeners();
  }

  void changeCheckoutStep(int index) {
    _checkoutStep = index;
    notifyListeners();
  }
}
