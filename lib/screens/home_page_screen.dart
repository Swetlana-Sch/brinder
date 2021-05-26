import 'package:flutter/material.dart';
import 'package:matching_cats/common_widgets/drawer.dart';
import 'file:///C:/Users/Svetlana-PC/AndroidStudioProjects/matching_cats/lib/screens/sign_in_page.dart';
import 'package:provider/provider.dart';
import 'package:matching_cats/providers/authentication_provider.dart';

class HomePageScreen extends StatelessWidget {
  static const routeName = '/home-page-screen';
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Authentication>(context);
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        actions: [
          ElevatedButton(
            onPressed: () async {
              await auth.signOut();
              print('FB sign out pressed');
              Navigator.of(context).pushNamed(SignInPage.routeName);
            },
            child: Icon(
              Icons.exit_to_app,
            ),
          )
        ],
      ),
      body: Center(child: Text('You are in the HomeScreen'),),

    );
  }
}
