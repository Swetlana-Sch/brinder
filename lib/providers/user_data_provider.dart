import 'package:flutter/material.dart';
import 'package:matching_cats/models/cat_model.dart';
import 'package:provider/provider.dart';

class UserDataProvider with ChangeNotifier{
  String? userName = 'John';
  String? userCity = 'Bonn';
  String? userPhoneNumber = '123-456-789';

  void saveUserData (String newName, String newCity, String newPhoneNumber) {
    userName = newName;
    userCity = newCity;
    userPhoneNumber = newPhoneNumber;
    notifyListeners();
  }

  List<CatModel> myCats = [
    CatModel(
        catName: 'Lucy',
        catImage:
        'https://www.thepedigreepaws.com/web/kitten_breed/4/1594239196-british-shorthair-for-sale-the-pedigree-paws.jpg',
        catBread: 'British shorthair',
        catPrice: 800,
        catCity: 'Lviv',
        catAge: 4,
        catDescription: 'Awesome red cat with green eyes'),
    CatModel(
        catName: 'Mark',
        catImage:
        'https://i.pinimg.com/originals/cb/b4/c3/cbb4c3585048e06cb3b49ccb30e4343d.png',
        catBread: 'Sphynx',
        catPrice: 700,
        catCity: 'Poltava',
        catAge: 2.5,
        catDescription: 'Awesome sphynx'),
    CatModel(
        catName: 'BooBoo',
        catImage:
        'https://catunited.com/wp-content/uploads/2020/07/yeswecatcattery_110042481_1033227033746460_476239828683541996_n.jpg',
        catPrice: 900,
        catCity: 'Kherson',
        catAge: 5,
        catDescription: 'Beautiful Georgian looking cat'),
    CatModel(catName: 'asdasd'),
  ];
}
