import 'package:flutter/material.dart';
import 'package:matching_cats/common%20widgets/email_sing_in_form.dart';
import 'package:matching_cats/consts.dart';
import 'package:matching_cats/utils/authentication_provider.dart';

class EmailSignInPage extends StatelessWidget {
  EmailSignInPage({required this.auth});
  final Authentication auth;
  static const routeName = '/email-sign-in-page-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in with Email'),
        backgroundColor: kAppBarColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
            child: EmailSingInForm(auth: auth,),
          color: kEmailCardColor,
        ),
      ),
      backgroundColor: kBackgroundLaunchColor,
    );
  }

}

