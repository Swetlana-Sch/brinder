import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:matching_cats/models/cat_model.dart';
import 'package:matching_cats/providers/user_data_provider.dart';
import 'package:matching_cats/screens/breed_screen.dart';
import 'package:matching_cats/theme.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

class EditCatScreen extends StatefulWidget {
  final CatModel? catModel;

  static const routeName = '/edit_cat_screen';

  const EditCatScreen({Key? key, this.catModel}) : super(key: key);

  @override
  _EditCatScreenState createState() => _EditCatScreenState();
}

class _EditCatScreenState extends State<EditCatScreen> {
  final picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();
  String? catName;
  String? catCity;
  String? catDescription;
  double? catAge;
  double? catPrice;
  File? catImage;
  late CatGender catGender;
  String? catBreed;
  FocusNode? nameFocusNode;
  FocusNode? cityFocusNode;

  // in EDIT CAT SCREEN init state
  // catName = widget.catModel.catName
  // ...
  // in form field:
  // initialValue: widget.catModel.catName,
  bool showImageErrorText = false;

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        catImage = File(pickedFile.path);
        showImageErrorText = false;
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  void initState() {
    catName = widget.catModel!.catName;
    catCity = widget.catModel!.catCity;
    catDescription = widget.catModel!.catDescription;
    catAge = widget.catModel!.catAge;
    catPrice = widget.catModel!.catPrice;
    catImage = widget.catModel!.catImage;
    catGender = widget.catModel?.catGender ?? CatGender.male;
    catBreed = widget.catModel!.catBread;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final catData = context.read<UserDataProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit cat'),
        actions: [
          IconButton(
              icon: Icon(
                Icons.save,
              ),
              onPressed: () {
                print('Presses updated');
                if (_formKey.currentState!.validate() &&
                    (catBreed != null) &&
                    (catImage != null)) {
                  catData.updateCatData(
                    catID: widget.catModel!.catID!,
                    updatedName: catName!,
                    updatedImage: catImage!,
                    updatedBread: catBreed!,
                    updatedPrice: catPrice!,
                    updatedCity: catCity!,
                    updatedAge: catAge!,
                    updatedCatDescription: catDescription!,
                    updatedGender: catGender,
                  );
                  Navigator.of(context).pop();
                } else {
                  if (catBreed == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Please select the breed'),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  }
                  if (catImage == null) {
                    setState(() {
                      showImageErrorText = true;
                    });
                  }
                }
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Breed:'),
                    if (catBreed != null) Text(catBreed!),
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
                        initialValue: widget.catModel!.catName,
                        focusNode: nameFocusNode,
                        textInputAction: TextInputAction.next,
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
                        onFieldSubmitted: (term) {
                          print('onFieldSubmitted: ${term}');
                          cityFocusNode?.requestFocus();
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
                        initialValue: widget.catModel!.catCity,
                        textInputAction: TextInputAction.next,
                        // focusNode: cityFocusNode,
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
                        initialValue: widget.catModel!.catDescription,
                        textInputAction: TextInputAction.next,
                        // focusNode: descriptionFocusNode,
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
                        initialValue:
                            widget.catModel!.catAge!.toStringAsFixed(0),
                        textInputAction: TextInputAction.next,
                        // focusNode: ageFocusNode,
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
                        initialValue:
                            widget.catModel!.catPrice!.toStringAsFixed(0),
                        textInputAction: TextInputAction.next,
                        // focusNode: priceFocusNode,
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
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Change image:', textAlign: TextAlign.left,),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image(
                            image: FileImage(catImage!),
                            width: 250,
                            height: 180,
                      fit: BoxFit.cover,
                          ),
                    FloatingActionButton(
                            onPressed: () {
                              getImage();
                              print('get image pressed');
                            },
                            child: Icon(Icons.edit, color: Colors.white,),
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

class ImageMissingErrorText extends StatelessWidget {
  final String? textError;

  const ImageMissingErrorText({
    Key? key,
    this.textError,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textError!,
      style: kErrorMissedImageTextStyle,
    );
  }
}
