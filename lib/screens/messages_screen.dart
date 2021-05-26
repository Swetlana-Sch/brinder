import 'package:flutter/material.dart';
import 'package:matching_cats/common_widgets/drawer.dart';
import 'package:matching_cats/consts.dart';

class MessagesScreen extends StatelessWidget {
  static const routeName = '/messages-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
      ),
      body: Center(child: Text('You are in the Dialogs'),),

    );
  }
}
