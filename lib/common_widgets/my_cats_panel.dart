import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:matching_cats/models/cat_model.dart';
import 'package:matching_cats/providers/user_data_provider.dart';
import 'package:matching_cats/screens/add_cat_screen.dart';
import 'package:provider/provider.dart';

class MyCatsPanel extends StatelessWidget {
  const MyCatsPanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final catData = context.watch<UserDataProvider>();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Cats:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                IconButton(
                  icon: Icon(
                    Icons.add,
                    size: 35,
                  ),
                  onPressed: () {
                    print('Add cat pressed');
                    Navigator.of(context).pushNamed(AddCatScreen.routeName);
                  },
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext cxt, int index) {
                return Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            // width: 50,
                            // height: 50,
                            child: Image.file(
                              File.fromUri(catData.myCats[index].catImage!.uri),
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          flex: 1,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(catData.myCats[index].catName!),
                          ),
                          flex: 3,
                        ),
                        catData.myCats[index].catGender! == CatGender.male
                            ? Icon(FontAwesomeIcons.mars)
                            : Icon(FontAwesomeIcons.venus),
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            print('Pressed edit cat');
                            // Navigator push EditCatScreen(catModel: catData.myCats[index])
                          },
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: catData.myCats.length,
            ),
          ],
        ),
      ),
    );
  }
}
