import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_app/models/user_data.dart';
import 'package:pharmacy_app/provider/appData.dart';
import 'package:provider/provider.dart';

class OrderData with ChangeNotifier {
  User? _user;
  User? get user => _user;

  UserData? _userData;
  UserData? get userData => _userData;

  String _firstName = '';
  String _lastName = '';
  String _email = '';
  String _phone = '';
  String _password = '';
  String _gender = '';
  String _wilaya = '';
  String _address = '';
  bool _alergy = false;
  bool _medication = false;

  Map<String, dynamic> orderData = {};

  void restUser() {
    _userData = null;
    notifyListeners();
  }

  // get user data after starting app if already logged in
  void getUserData() async {
    if (_user != null) {
      var snap = await FirebaseFirestore.instance.collection('Users').doc(_user!.uid).get();

      _userData = UserData.fromMap(snap.data()!);
    }
  }

  void setUser(User user) {
    _user = user;
  }

  // hold data temperary
  void setUserData(Map<String, dynamic> userData) {
    _firstName = userData["first_name"] != null ? userData["first_name"] : _firstName;
    _lastName = userData["last_name"] != null ? userData["last_name"] : _lastName;
    _email = userData["email"] != null ? userData["email"] : _email;
    _phone = userData["phone"] != null ? userData["phone"] : _phone;
    _password = userData["password"] != null ? userData["password"] : _password;
    _gender = userData["gender"] != null ? userData["gender"] : _gender;
    _wilaya = userData["wilaya"] != null ? userData["wilaya"] : _wilaya;
    _address = userData["address"] != null ? userData["address"] : _address;
    _alergy = userData["alergy"] != null
        ? userData["alergy"] == "Yes"
            ? true
            : false
        : _alergy;
    _medication = userData["medication"] != null
        ? userData["medication"] == "Yes"
            ? true
            : false
        : _medication;
  }

  // add user data to firebase
  Future<bool> registerUser(BuildContext context) async {
    print({
      "first_name": _firstName,
      "last_name": _lastName,
      "email": _email,
      "phone": _phone,
      "gender": _gender,
      "wilaya": _wilaya,
      "address": _address,
      "alergy": _alergy,
      "medication": _medication,
    });
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
    if (userCredential.user != null) {
      setUser(userCredential.user!);
      await FirebaseFirestore.instance.collection('Users').doc(userCredential.user!.uid).set({
        "first_name": _firstName,
        "last_name": _lastName,
        "email": _email,
        "phone": _phone,
        "gender": _gender,
        "wilaya": _wilaya,
        "address": _address,
        "alergy": _alergy,
        "medication": _medication,
      });
      return true;
    }
    return false;
  }

  // fetch user checkout data
  void fetchUserData() async {
    var snap = await FirebaseFirestore.instance.collection('Users').doc(user!.uid).get();

    print(snap.data());
  }

  // save order data
  void saveOrderData(BuildContext context, String deliveryType) {
    double totalePrice = Provider.of<AppData>(context, listen: false).totalPrice;
    switch (deliveryType) {
      case "Standard delivery":
        totalePrice += 500;
        break;
      case "Fast delivery":
        totalePrice += 1000;
        break;
      case "Deliver to another address":
        totalePrice += 500;
        break;
    }
    List cart = [];
    Provider.of<AppData>(context, listen: false).carte.forEach(
          (element) => cart.add(
            {
              "title": element.title,
              "qty": element.qty
            },
          ),
        );

    Map<String, dynamic> tempOrderData = {
      "name": "${_userData!.firstName} ${_userData!.lastName}",
      "address": "${_userData!.address}, ${_userData!.wilaya}",
      "order": cart,
      "total": totalePrice,
      "delivery_type": deliveryType
    };
    orderData = tempOrderData;
  }

  // make order
  void makeOrder(String payment) async {
    print({
      "payment_type": payment,
      ...orderData,
    });
    var snap = await FirebaseFirestore.instance.collection('Orders').add({
      "payment_type": payment,
      ...orderData,
    });

    print(snap);
  }
}
