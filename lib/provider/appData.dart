import 'package:flutter/cupertino.dart';
import 'package:pharmacy_app/widgets/carte_medcine_tile.dart';

class AppData with ChangeNotifier {
  int _pageIndex = 0;
  int get pageIndex => _pageIndex;

  int _checkoutStep = 0;
  int get checkoutStep => _checkoutStep;

  List _carte = [
    CarteMedcineTile(
      title: 'Doliprane©Paracetamol 1000mg',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam mattis condimentum ultrices. Phasellus iaculis fermentum.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam mattis condimentum ultrices. Phasellus iaculis fermentum.',
      imageUrl: 'assets/images/doliprane.png',
    ),
    CarteMedcineTile(
      title: 'Doliprane©Paracetamol 500mg',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam mattis condimentum ultrices. Phasellus iaculis fermentum.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam mattis condimentum ultrices. Phasellus iaculis fermentum.',
      imageUrl: 'assets/images/doliprane.png',
    ),
  ];
  List get carte => _carte;

  void changePage(int index) {
    _pageIndex = index;
    notifyListeners();
  }

  void changeCheckoutStep(int index) {
    _checkoutStep = index;
    notifyListeners();
  }

  void printQty(int index) {
    print(_carte[index].qty);
  }
}
