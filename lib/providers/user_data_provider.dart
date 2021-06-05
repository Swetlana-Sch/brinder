import 'dart:io';

import 'package:flutter/material.dart';
import 'package:matching_cats/models/cat_model.dart';
import 'package:provider/provider.dart';
import 'package:short_uuids/short_uuids.dart';

class UserDataProvider with ChangeNotifier {
  String? userName = 'John';
  String? userCity = 'Bonn';
  String? userPhoneNumber = '123-456-789';
  final shortID = ShortUuid();
  List<CatModel> myCats = [
    //   CatModel(
    //       catName: 'Lucy',
    //       catImage:
    //           'https://www.thepedigreepaws.com/web/kitten_breed/4/1594239196-british-shorthair-for-sale-the-pedigree-paws.jpg',
    //       catBread: 'British shorthair',
    //       catPrice: 800,
    //       catCity: 'Lviv',
    //       catAge: 4,
    //       catDescription: 'Awesome red cat with green eyes'),
    //   CatModel(
    //       catName: 'Mark',
    //       catImage:
    //           'https://i.pinimg.com/originals/cb/b4/c3/cbb4c3585048e06cb3b49ccb30e4343d.png',
    //       catBread: 'Sphynx',
    //       catPrice: 700,
    //       catCity: 'Poltava',
    //       catAge: 2.5,
    //       catDescription: 'Awesome sphynx'),
    //   CatModel(
    //       catName: 'BooBoo',
    //       catImage:
    //           'https://catunited.com/wp-content/uploads/2020/07/yeswecatcattery_110042481_1033227033746460_476239828683541996_n.jpg',
    //       catPrice: 900,
    //       catCity: 'Kherson',
    //       catAge: 5,
    //       catDescription: 'Beautiful Georgian looking cat'),
  ];

  List<String> catBreeds = [
    'Abyssinian',
    'Aegean',
    'American Bobtail',
    'American Curl',
    'American Ringtail',
    'American Shorthair',
    'American Wirehair',
    'Aphrodite Giant',
    'Arabian Mau',
    'Asian',
    'Asian Semi-longhair',
    'Australian Mist',
    'Balinese',
    'Bambino',
    'Bengal',
    'Birman',
    'Bombay',
    'Brazilian Shorthair',
    'British Longhair',
    'British Shorthair',
    'Burmese',
    'Burmilla',
    'California Spangled',
    'Chantilly-Tiffany',
    'Chartreux',
    'Chausie',
    'Colorpoint Shorthair',
    'Cornish Rex',
    'Cymric',
    'Cyprus',
    'Devon Rex',
    'Don Sphynx',
    'Dragon Li',
    'Dwelf',
    'Egyptian Mau',
    'European Shorthair',
    'Exotic Shorthair',
    'Foldex',
    'German Rex',
    'Havana Brown',
    'Highlander',
    'Himalayan',
    'Japanese Bobtail',
    'Javanese',
    'Kanaani',
    'Khao Manee',
    'Kinkalow',
    'Korat',
    'Korean Bobtail',
    'Korn Ja',
    'Kurilian Bobtail',
    'Lambkin',
    'LaPerm',
    'Lykoi',
    'Maine Coon',
    'Manx',
    'Mekong Bobtail',
    'Minskin',
    'Napoleon',
    'Munchkin',
    'Nebelung',
    'Norwegian Forest Cat',
    'Ocicat',
    'Ojos Azules',
    'Oregon Rex',
    'Oriental Bicolor',
    'Oriental Longhair',
    'Oriental Shorthair',
    'Persian (modern)',
    'Persian (traditional)',
    'Peterbald',
    'Pixie-bob',
    'Ragamuffin',
    'Ragdoll',
    'Raas',
    'Russian Blue',
    'Russian White',
    'Russian Black',
    'Russian Tabby',
    'Sam Sawet',
    'Savannah',
    'Scottish Fold',
    'Scottish Stright',
    'Selkirk Rex',
    'Serengeti',
    'Serrade Petit',
    'Siamese (modern)',
    'Siberian Forest Cat',
    'Singapura',
    'Snowshoe',
    'Sokoke',
    'Somali',
    'Sphynx',
    'Suphalak',
    'Thai (old style Siamese)',
    'Thai Lilac',
    'Thai Blue',
    'Thai Blue Point',
    'Thai Lilac Point',
    'Tonkinese',
    'Toyger',
    'Turkish Angora',
    'Turkish Van',
    'Turkish Vankedisi',
    'Ukrainian Levkoy',
    'York Chocolate',
  ];

  void saveUserData(String newName, String newCity, String newPhoneNumber) {
    userName = newName;
    userCity = newCity;
    userPhoneNumber = newPhoneNumber;
    notifyListeners();
  }

  void saveCatData(
      {
        required String newName,
      required File newImage,
      required String newBread,
      required double newPrice,
      required String newCity,
      required double newAge,
        required CatGender newGender,
      required String newCatDescription}) {
    final newCatModel = CatModel(
      catID: shortID.generate(),
      catName: newName,
      catImage: newImage,
      catBread: newBread,
      catPrice: newPrice,
      catCity: newCity,
      catAge: newAge,
      catGender: newGender,
      catDescription: newCatDescription,
    );
    print('CatModel: $newCatModel');
    myCats.add(newCatModel);
    print('CatModel: $newCatModel');
    notifyListeners();
  }
}
