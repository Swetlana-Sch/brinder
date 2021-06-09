import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:matching_cats/models/cat_model.dart';
import 'package:matching_cats/providers/user_data_provider.dart';
import 'package:provider/provider.dart';

class DetailCatScreen extends StatefulWidget {
  static const routeName = '/detail_cat_screen';

  final CatModel? catModel;

  const DetailCatScreen({Key? key, this.catModel}) : super(key: key);

  @override
  _DetailCatScreenState createState() => _DetailCatScreenState();
}

class _DetailCatScreenState extends State<DetailCatScreen> {
  @override
  // void initState() {
  //   // TODO: implement initState
  //   catName = widget.catModel!.catName;
  //   catCity = widget.catModel!.catCity;
  //   catDescription = widget.catModel!.catDescription;
  //   catAge = widget.catModel!.catAge;
  //   catPrice = widget.catModel!.catPrice;
  //   catImage = widget.catModel!.catImage;
  //   catGender = widget.catModel?.catGender ?? CatGender.male;
  //   catBreed = widget.catModel!.catBread;
  //
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final userData = context.read<UserDataProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Detailed info'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.catModel!.catName!),
                    Icon(Icons.favorite_border),
                  ],
                ),
              ),
              Image(
                image: FileImage(widget.catModel!.catImage!),
                width: 250,
                height: 180,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        widget.catModel!.catGender == CatGender.male
                            ? Icon(FontAwesomeIcons.mars)
                            : Icon(FontAwesomeIcons.venus),
                        widget.catModel!.catGender == CatGender.male ? Text('Male') : Text('Female'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(FontAwesomeIcons.map),
                        SizedBox(width: 10,),
                        Text(widget.catModel!.catCity!),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Price: ${widget.catModel!.catPrice}'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(widget.catModel!.catDescription!),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Icon(FontAwesomeIcons.phone),
                            SizedBox(width: 10,),
                            Text(userData.userPhoneNumber!),
                          ],
                        ),
                        Text(userData.userName!),
                      ],
                    ),
                    IconButton(
                      icon: Icon(FontAwesomeIcons.envelope),
                      onPressed: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
