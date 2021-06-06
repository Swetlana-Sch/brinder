import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:matching_cats/models/cat_model.dart';
import 'package:matching_cats/providers/user_data_provider.dart';
import 'package:matching_cats/theme.dart';
import 'package:provider/provider.dart';

class SingleCatItem extends StatelessWidget {
  final CatModel? catModel;

  const SingleCatItem({Key? key, this.catModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final catData = context.watch<UserDataProvider>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
          onTap: () {
            print('Pressed a single cat');
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GridTile(
              footer: GridTileBar(
                backgroundColor: Colors.black26,
                title: Text(catModel!.catName!, style: kDrawerTextStyle,),
                trailing: catModel!.catGender == CatGender.male
                    ? Icon(FontAwesomeIcons.mars)
                    : Icon(FontAwesomeIcons.venus),
              ),
              child: Image(
                image: FileImage(catModel!.catImage!),
                width: 250,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
          )),
    );
  }
}

// Image(image: FileImage(catModel!.catImage!),
// width: 250,
// height: 180,
// fit: BoxFit.cover,),
