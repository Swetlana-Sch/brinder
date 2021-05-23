import 'package:flutter/material.dart';
import 'package:matching_cats/common%20widgets/sing_in_button.dart';
import 'package:matching_cats/consts.dart';
import 'package:matching_cats/utils/authentication_provider.dart';
import 'package:provider/provider.dart';

enum EmailSignInFormType { signIn, register }

class EmailSingInForm extends StatefulWidget {
  EmailSingInForm({required this.auth});
  final Authentication auth;
  @override
  _EmailSingInFormState createState() => _EmailSingInFormState();
}

class _EmailSingInFormState extends State<EmailSingInForm> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  //default value
  EmailSignInFormType _formType = EmailSignInFormType.signIn;


  void _submit() async{
    if (_formType == EmailSignInFormType.signIn) {

    }
  }

  void _toggleFormType() {
    setState(() {
      _formType = _formType == EmailSignInFormType.signIn
          ? EmailSignInFormType.register
          : EmailSignInFormType.signIn;
    });
    // this will delete the texts in the TextFields when we toggle the form
    _emailController.clear();
    _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Authentication>(context);
    final primaryText = _formType == EmailSignInFormType.signIn
        ? 'Sign in'
        : 'Create an account';
    final secondaryText = _formType == EmailSignInFormType.signIn
        ? 'Need an account? Register'
        : 'Have an account? Sign in';
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            decoration:
                InputDecoration(labelText: 'Email', hintText: 'test@test.com'),
            controller: _emailController,
          ),
          SizedBox(
            height: 8,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
            controller: _passwordController,
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: ()  {

            },
            child: Text(primaryText),
            style: kElevatedButtonStyle,
          ),
          TextButton(
            onPressed: () {
              _toggleFormType();
            },
            child: Text(secondaryText),
            style: kTextButtonStyle,
          ),
        ],
      ),
    );
  }
}
