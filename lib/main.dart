import 'package:flutter/material.dart';
import 'package:matching_cats/consts.dart';

import 'sign_in_page.dart';

void main() {
  runApp(CatsMatchApp());
}

class CatsMatchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 3)),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(home: Splash());
        } else {
          return MaterialApp(
            home: SignInPage(),
          );
        }
      },
    );
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundLaunchColor,
      body: Stack(
        children: [
          Center(
              child: CircleAvatar(radius: 120, child: Image.asset(kCatLogo))),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.5 - 250,

            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Text(

                'Brinder',
                style: kLaunchTextStyle, textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
