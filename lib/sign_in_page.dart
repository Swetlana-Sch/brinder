import 'package:flutter/material.dart';
import 'package:matching_cats/assets.dart';
import 'package:matching_cats/common%20widgets/sing_in_button.dart';
import 'package:matching_cats/consts.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _visible = false;

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 50), () {
      setState(() {
        _visible = !_visible;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundLaunchColor,
      body: AnimatedOpacity(
        duration: Duration(milliseconds: 1000),
        opacity: _visible ? 1 : 0,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(radius: 50, child: Image.asset(Assets.sCatLogo)),
              SizedBox(
                height: 30,
              ),
              Text(
                'Sign In',
                style: kLaunchTextStyle,
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                color: Colors.white24,
                thickness: 1,
                indent: 50,
                endIndent: 50,
              ),
              SizedBox(
                height: 50,
              ),
              SignInButton(
                text: 'Sign In with Google',
                textColor: kGoogleSignInTextColor,
                color: kGoogleSignInButtonColor,
                onPressed: () {},
              ),
              SizedBox(
                height: 10,
              ),
              SignInButton(
                text: 'Sign In with Facebook',
                textColor: kFaceBookSignInTextColor,
                color: kFaceBookSignInButtonColor,
                onPressed: () {},
              ),
              SizedBox(
                height: 10,
              ),
              SignInButton(
                text: 'Sign In with Email',
                textColor: kEmailSignInTextColor,
                color: kEmailSignInButtonColor,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
