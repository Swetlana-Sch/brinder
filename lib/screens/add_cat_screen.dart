import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:matching_cats/common_widgets/drawer.dart';
import 'package:matching_cats/models/cat_model.dart';
import 'package:matching_cats/models/cat_model.dart';
import 'package:matching_cats/providers/user_data_provider.dart';
import 'package:matching_cats/screens/breed_screen.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toggle_switch/toggle_switch.dart';

class AddCatScreen extends StatefulWidget {
  static const routeName = '/add_cat_screen';
  @override
  _AddCatScreenState createState() => _AddCatScreenState();
}

class _AddCatScreenState extends State<AddCatScreen> {
  final picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();
  String? catName;
  String? catCity;
  String? catDescription;
  double? catAge;
  double? catPrice;
  File? catImage;
  CatGender? catGender;
  String? catBreed;

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        catImage = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final catData = context.read<UserDataProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new cat'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.save,
            ),
            onPressed: () {
              print('Presses saved');
              print('cat name: $catName');
              if (_formKey.currentState!.validate()) {
                catData.saveCatData(
                  newName: catName!,
                  newImage: catImage!,
                  newBread: 'Spss',
                  newPrice: catPrice!,
                  newCity: catCity!,
                  newAge: catAge!,
                  newCatDescription: catDescription!,
                  newGender: catGender!,
                );
                Navigator.of(context).pop();
              }
              ;
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Breed:'),
                    Text(catBreed == null ? '' : catBreed!),
                    ElevatedButton(
                        onPressed: () async {
                          final resultBreed = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BreedsScreen(),
                              ));
                          // await Navigator.of(context).pushNamed(BreedsScreen.routeName);
                          setState(() {
                            catBreed = resultBreed;
                          });
                        },
                        child: Text('Select Breed')),
                  ],
                ),
                Row(
                  children: [
                    Text('Name:'),
                    Expanded(
                      child: TextFormField(
                        textCapitalization: TextCapitalization.sentences,
                        onChanged: (String? newCatName) {
                          setState(() {
                            catName = newCatName;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the name';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('City:'),
                    Expanded(
                      child: TextFormField(
                        textCapitalization: TextCapitalization.sentences,
                        onChanged: (String? newCatCity) {
                          setState(() {
                            catCity = newCatCity;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the city';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('Description:'),
                    Expanded(
                      child: TextFormField(
                        textCapitalization: TextCapitalization.sentences,
                        onChanged: (String? newCatDescription) {
                          setState(() {
                            catDescription = newCatDescription;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the description';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('Cat Age:'),
                    Expanded(
                      child: TextFormField(
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        onChanged: (String? newCatAge) {
                          setState(() {
                            print('catage: $catAge');
                            catAge = double.parse(newCatAge!);
                            print('catage after: $catAge');
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the age';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('Cat Price:'),
                    Expanded(
                      child: TextFormField(
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        onChanged: (String? newCatPrice) {
                          setState(() {
                            catPrice = double.parse(newCatPrice!);
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the price';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Select image:'),
                    FloatingActionButton(
                      onPressed: () {
                        getImage();
                        print('get image pressed');
                      },
                      tooltip: 'Pick Image',
                      child: Icon(Icons.photo_filter),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Select Gender:'),
                    ToggleSwitch(
                      minWidth: 50.0,
                      initialLabelIndex: 0,
                      cornerRadius: 10.0,
                      activeFgColor: Colors.white,
                      inactiveBgColor: Colors.grey,
                      inactiveFgColor: Colors.white,
                      labels: ['', ''],
                      icons: [FontAwesomeIcons.mars, FontAwesomeIcons.venus],
                      activeBgColors: [Colors.blue, Colors.pink],
                      onToggle: (index) {
                        print('switched to: $index');
                        catGender = CatGender.values[index];
                        // setState(() {
                        //   catGender = CatGender.values[index];
                        // });
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
