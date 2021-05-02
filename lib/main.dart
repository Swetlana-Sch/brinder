import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matching_cats/consts.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'home_page.dart';

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
          // Loading is done, return the app:
          return MaterialApp(
            home: HomePage(),
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
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(radius: 120, child: Image.asset(kCatLogo)),
              SizedBox(
                height: 10,
              ),
              Text(
                'Brinder',
                style: kLaunchTextStyle,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
