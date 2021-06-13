import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderData with ChangeNotifier {
  User? _user;
  User? get user => _user;

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

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  //hold data temperary
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

  //fetch user checkout data
  void fetchUserData() async {
    var snap = await FirebaseFirestore.instance.collection('Users').doc(user!.uid).get();

    print(snap.data());
  }
}
