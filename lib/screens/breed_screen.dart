import 'package:flutter/material.dart';
import 'package:matching_cats/common_widgets/drawer.dart';
import 'package:matching_cats/providers/user_data_provider.dart';
import 'package:matching_cats/theme.dart';
import 'package:provider/provider.dart';

class BreedsScreen extends StatelessWidget {
  static const routeName = '/breeds_screen';
  @override
  Widget build(BuildContext context) {
    final catData = context.read<UserDataProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Breeds:'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (BuildContext cxt, int index) {
            return GestureDetector(
              onTap: (){
                String selectedBreed = catData.catBreeds[index];
                Navigator.pop(context, selectedBreed);
              },
              child: Container(
                width: 100,
                height: 40,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(catData.catBreeds[index]),
                  ),
                ),
              ),
            );
          },
          itemCount: catData.catBreeds.length,
        ),
      ),
    );
    ;
  }
}
