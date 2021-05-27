import 'package:flutter/cupertino.dart';

enum CatGender {
  Male,
  Female,
}

class CatModel {
  String? catName;
  String? catImage;
  String? catBread;
  double? catPrice;
  String? catCity;
  double? catAge;
  String? catDescription;
  CatGender? catGender;

  CatModel({
    this.catName,
    this.catImage,
    this.catBread,
    this.catPrice,
    this.catCity,
    this.catAge,
    this.catDescription,
    this.catGender,
  });

  @override
  String toString() {
    return 'CatModel{catName: $catName, catImage: $catImage, catBread: $catBread, catPrice: $catPrice, catCity: $catCity, catAge: $catAge, catDescription: $catDescription}';
  }

  factory CatModel.fromJson(Map<String, dynamic> json) => CatModel(
        catName: json['cat_name'],
        catImage: json['cat_url'],
        catBread: json['cat_bread'],
        catPrice: json['cat_price'],
        catAge: json['cat_age'],
        catDescription: json['cat_description'],
        catCity: json['cat_city'],
        catGender: json['cat_gender'],
      );

  Map<String, dynamic> toJson() => {
        'cat_name': catName,
        'cat_url': catImage,
        'cat_bread': catBread,
        'cat_price': catPrice,
        'cat_age': catAge,
        'cat_description': catDescription,
        'cat_city': catCity,
        'cat_gender': catGender,
      };

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
  ];
}
