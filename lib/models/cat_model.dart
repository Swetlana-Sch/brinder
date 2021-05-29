import 'package:matching_cats/utils/app_utils.dart';

enum CatGender {
  male,
  female,
}

// why do we need this variable?
final typeValues =
    EnumValues({"male": CatGender.male, 'female': CatGender.female});

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
    this.catGender = CatGender.male,
  });

  @override
  String toString() {
    return 'CatModel{catName: $catName, catImage: $catImage, catBread: $catBread, catPrice: $catPrice, catCity: $catCity, catAge: $catAge, catDescription: $catDescription}';
  }

  // factory Hit.fromJson(Map<String, dynamic> json) => Hit(
  //   type: json["type"] == null ? null : typeValues.map[json["type"]],
  // );
  //
  //
  // Map<String, dynamic> toJson() =>
  //     {
  //       "type": type == null ? null : typeValues.reverse![type!],
  //     }

  factory CatModel.fromJson(Map<String, dynamic> json) => CatModel(
        catName: json['cat_name'],
        catImage: json['cat_url'],
        catBread: json['cat_bread'],
        catPrice: json['cat_price'],
        catAge: json['cat_age'],
        catDescription: json['cat_description'],
        catCity: json['cat_city'],
        catGender: typeValues.map[json['cat_gender']],
      );

  Map<String, dynamic> toJson() => {
        'cat_name': catName,
        'cat_url': catImage,
        'cat_bread': catBread,
        'cat_price': catPrice,
        'cat_age': catAge,
        'cat_description': catDescription,
        'cat_city': catCity,
        'cat_gender': typeValues.reverse![catGender],
      };
}
