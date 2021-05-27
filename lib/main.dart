import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:matching_cats/assets.dart';
import 'package:matching_cats/consts.dart';
import 'package:matching_cats/providers/user_profile_provider.dart';
import 'package:matching_cats/screens/email_sign_in_page.dart';
import 'package:matching_cats/screens/favourites_screen.dart';
import 'package:matching_cats/screens/home_page_screen.dart';
import 'package:matching_cats/providers/authentication_provider.dart';
import 'package:matching_cats/screens/messages_screen.dart';
import 'package:matching_cats/screens/search_screen.dart';
import 'package:matching_cats/screens/settings_screen.dart';
import 'package:matching_cats/screens/user_profile_screen.dart';
import 'package:provider/provider.dart';

import 'screens/sign_in_page.dart';

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
        ChangeNotifierProvider(
          create: (context) => UserProfile(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.orange,
          primarySwatch: Colors.orange,
        ),
        routes: {
          HomePageScreen.routeName: (ctx) => HomePageScreen(),
          SignInPage.routeName: (ctx) => SignInPage(),
          EmailSignInPage.routeName: (ctx) => EmailSignInPage(),
          UserProfileScreen.routeName: (ctx) => UserProfileScreen(),
          SearchScreen.routeName: (ctx) => SearchScreen(),
          MessagesScreen.routeName: (ctx) => MessagesScreen(),
          FavouritesScreen.routeName: (ctx) => FavouritesScreen(),
          SettingsScreen.routeName: (ctx) => SettingsScreen(),
        },
        home: SplashPage(),
        // FutureBuilder(
        //   future: Future.delayed(Duration(seconds: 3)),
        //   builder: (context, AsyncSnapshot snapshot) {
        //     // Show splash screen while waiting for app resources to load:
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return SplashPage();
        //     } else {
        //       return SignInPage();
        //     }
        //   },
        // ),
      ),
    );
  }
}

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  StreamSubscription? onUserChange;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      User? fbUser;
      final firebaseAuth = context.read<Authentication>().firebaseAuth;
      onUserChange =
          firebaseAuth.authStateChanges().listen((User? firebaseUser) {
        fbUser = firebaseUser;
        if (fbUser != null) {
          Navigator.of(context).pushReplacementNamed(HomePageScreen.routeName);
        } else {
          Navigator.of(context).pushReplacementNamed(SignInPage.routeName);
        }
      });
    });
  }

  @override
  void dispose() {
    onUserChange?.cancel();
    super.dispose();
  }

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
