import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:matching_cats/assets.dart';
import 'package:matching_cats/consts.dart';
import 'package:matching_cats/screens/home_page_screen.dart';
import 'package:matching_cats/utils/authentication_provider.dart';
import 'package:provider/provider.dart';

import 'sign_in_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(CatsMatchApp());
}

class CatsMatchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Authentication(),
        ),
      ],
      child: MaterialApp(
        routes: {
          HomePageScreen.routeName: (ctx) => HomePageScreen(),
          SignInPage.routeName: (ctx) => SignInPage(),
        },
        home: FutureBuilder(
          future: Future.delayed(Duration(seconds: 3)),
          builder: (context, AsyncSnapshot snapshot) {
            // Show splash screen while waiting for app resources to load:
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SplashPage();
            } else {
              return SignInPage();
            }
          },
        ),
      ),
    );
  }
}

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundLaunchColor,
      body: Stack(
        children: [
          Center(
              child: CircleAvatar(
                  radius: 120, child: Image.asset(Assets.sCatLogo))),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.5 - 250,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                'Brinder',
                style: kLaunchTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
