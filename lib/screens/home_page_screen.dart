import 'package:flutter/material.dart';
import 'package:matching_cats/common_widgets/cat_grid.dart';
import 'package:matching_cats/common_widgets/drawer.dart';
import 'package:matching_cats/providers/authentication_provider.dart';
import 'package:matching_cats/providers/user_data_provider.dart';
import 'package:matching_cats/screens/add_cat_screen.dart';
import 'package:provider/provider.dart';

import 'file:///C:/Users/Svetlana-PC/AndroidStudioProjects/matching_cats/lib/screens/sign_in_page.dart';

class HomePageScreen extends StatelessWidget {
  static const routeName = '/home-page-screen';

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Authentication>(context);
    final catData = Provider.of<UserDataProvider>(context);
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
      body: catData.myCats.length == 0 ? Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('No cats yet')),
          ElevatedButton(onPressed: (){
            Navigator.of(context).pushNamed(AddCatScreen.routeName);
          },
              child: Text('Add Cat'
              ),)
        ],
      ) : CatGreed(),
    );
  }
}
