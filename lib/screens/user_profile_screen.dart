import 'package:flutter/material.dart';
import 'package:matching_cats/common_widgets/drawer.dart';

class UserProfileScreen extends StatelessWidget {
  static const routeName = '/user-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        actions: [
          ElevatedButton(
            onPressed: () {
            },
            child: Icon(
              Icons.edit,
            ),
          )
        ],
      ),
      body: Center(child: Text('You are in the UserScreen'),),

    );
  }
}
