import 'package:flutter/material.dart';
import 'package:matching_cats/consts.dart';
import 'package:provider/provider.dart';
import 'package:matching_cats/providers/authentication_provider.dart';

enum EmailSignInFormType { signIn, register }

class EmailSingInForm extends StatefulWidget {

  @override
  _EmailSingInFormState createState() => _EmailSingInFormState();
}

class _EmailSingInFormState extends State<EmailSingInForm> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  String get _email => _emailController.text;
  String get _password => _passwordController.text;

  //default value
  EmailSignInFormType _formType = EmailSignInFormType.signIn;

  void _submit(Authentication auth) async {
    try {
      if (_formType == EmailSignInFormType.signIn) {
        await auth.signInWithEmailAndPassWord(_email, _password);
      } else {
        await auth.createUserWithEmailAndPassword(_email, _password);
      }
      // if the registration is successful we dismiss the registration page automatically
      Navigator.of(context).pop();
    } catch (e) {
      print(e.toString());
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
    // the same results
    // final auth = Provider.of<Authentication>(context, listen: false);
    final auth2 = context.read<Authentication>();
    // the same results
    // final auth3 = Provider.of<Authentication>(context);
    // final auth4 = context.watch<Authentication>();

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
            onPressed: () {
              _submit(auth2);
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
