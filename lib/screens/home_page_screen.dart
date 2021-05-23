import 'package:flutter/material.dart';
import 'package:matching_cats/sign_in_page.dart';
import 'package:matching_cats/utils/authentication_provider.dart';
import 'package:provider/provider.dart';

class HomePageScreen extends StatelessWidget {
  static const routeName = '/home-page-screen';
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Authentication>(context);
    return Scaffold(
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
      body: Center(child: Text('You are in the app'),),

    );
  }
}
