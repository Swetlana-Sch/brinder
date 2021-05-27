import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProfile with ChangeNotifier{
  String? userName = 'John';
  String? userCity = 'Bonn';
  String? userPhoneNumber = '123-456-789';

  void saveUserData (String newName, String newCity, String newPhoneNumber) {
    userName = newName;
    userCity = newCity;
    userPhoneNumber = newPhoneNumber;
    notifyListeners();
  }
}
