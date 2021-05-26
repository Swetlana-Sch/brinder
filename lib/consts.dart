
import 'package:flutter/material.dart';


const kBackgroundLaunchColor = Color(0xffffcc00);
const kAppBarColor = Color(0xfffc7f03);
const kEmailCardColor = Color(0xfffcf4cf);
const kGoogleSignInButtonColor = Colors.white;
const kGoogleSignInTextColor = Colors.black87;
const kFaceBookSignInButtonColor = Color(0xff334d92);
const kFaceBookSignInTextColor = Colors.white;
const kEmailSignInButtonColor = Colors.teal;
const kEmailSignInTextColor = Colors.white;

const kLaunchTextStyle = TextStyle (
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
  color: Colors.white,
  fontFamily: 'Pacifico-Regular',
);

const kAppBarTextStyle = TextStyle (
  fontSize: 20.0,
  fontWeight: FontWeight.w700,
  color: Colors.white,
  fontFamily: 'Pacifico-Regular',
);

const kDrawerTextStyle = TextStyle(
  fontSize: 18.0,
  color: Colors.white,
);

final ButtonStyle kElevatedButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.white,
  primary: kAppBarColor,
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
);

final ButtonStyle kTextButtonStyle = TextButton.styleFrom(
  primary: Colors.black54,
  padding: EdgeInsets.symmetric(horizontal: 16.0),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2.0)),
),
);

