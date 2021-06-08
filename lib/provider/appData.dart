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
      price: 125,
    ),
    CarteMedcineTile(
      title: 'Doliprane©Paracetamol 500mg',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam mattis condimentum ultrices. Phasellus iaculis fermentum.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam mattis condimentum ultrices. Phasellus iaculis fermentum.',
      imageUrl: 'assets/images/doliprane.png',
      inStock: false,
      isFavorite: true,
      price: 100,
    ),
    CarteMedcineTile(
      title: 'Doliprane©Paracetamol 1500mg',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam mattis condimentum ultrices. Phasellus iaculis fermentum.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam mattis condimentum ultrices. Phasellus iaculis fermentum.',
      imageUrl: 'assets/images/doliprane.png',
      inStock: true,
      isFavorite: true,
      price: 155,
    ),
  ];
  List get carte => _carte;

  double _totalPrice = 0;
  double get totalPrice => _totalPrice;

  void changePage(int index) {
    _pageIndex = index;
    notifyListeners();
  }

  void changeCheckoutStep(int index) {
    _checkoutStep = index;
    notifyListeners();
  }

  void getTotalPrice() {
    _carte.forEach((element) {
      _totalPrice += element.price;
    });
    notifyListeners();
  }
}
