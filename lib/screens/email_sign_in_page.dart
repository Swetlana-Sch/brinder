import 'package:flutter/material.dart';
import 'package:matching_cats/common_widgets/drawer.dart';
import 'package:matching_cats/providers/authentication_provider.dart';
import 'package:matching_cats/common_widgets/email_sing_in_form.dart';
import 'package:matching_cats/theme.dart';


class EmailSignInPage extends StatelessWidget {
  static const routeName = '/email-sign-in-page-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('Sign in with Email'),
        backgroundColor: kAppBarColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
            child: EmailSingInForm(),
          color: kEmailCardColor,
        ),
      ),
      backgroundColor: kBackgroundLaunchColor,
    );
  }

}

