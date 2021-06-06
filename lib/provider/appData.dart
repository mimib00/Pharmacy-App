import 'package:flutter/cupertino.dart';

class AppData with ChangeNotifier {
  int _pageIndex = 0;
  int get pageIndex => _pageIndex;

  void changePage(int index) {
    _pageIndex = index;
    notifyListeners();
  }
}
