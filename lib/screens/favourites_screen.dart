import 'package:flutter/material.dart';
import 'package:matching_cats/common_widgets/drawer.dart';
import 'package:matching_cats/theme.dart';

class FavouritesScreen extends StatelessWidget {
  static const routeName = '/favourites-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(

      ),
      body: Center(child: Text('You are in the list of favourites'),),

    );;
  }
}
