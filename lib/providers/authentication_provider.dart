import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class Authentication with ChangeNotifier {
  final _firebaseAuth = FirebaseAuth.instance;
  FirebaseAuth get firebaseAuth => _firebaseAuth;

  StreamSubscription<User?>? userStream;
  User? firebaseUser;

  bool isLoading = false;

  SnackBar customSnackBar({required String content}) {
    return SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        content,
        style: TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
      ),
    );
  }


  //Using Stream to listen to Authentication State
  Stream<User?> get authState => firebaseAuth.idTokenChanges();

  Authentication() {
    userStream = authState.listen((User? user) {
      print('listener user $user');
      firebaseUser = user;
    });
  }

  Future<User?> signInWithGoogle({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
    await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
        await auth.signInWithCredential(credential);

        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          ScaffoldMessenger.of(context).showSnackBar(
            customSnackBar(
              content:
              'The account already exists with a different credential.',
            ),
          );
        } else if (e.code == 'invalid-credential') {
          ScaffoldMessenger.of(context).showSnackBar(
            customSnackBar(
              content:
              'Error occurred while accessing credentials. Try again.',
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          customSnackBar(
            content: 'Error occurred using Google Sign-In. Try again.',
          ),
        );
      }
    }
  }

  // Future<void> signOutGoogle({required BuildContext context}) async {
  //   final GoogleSignIn googleSignIn = GoogleSignIn();
  //
  //   try {
  //     await googleSignIn.signOut();
  //     await FirebaseAuth.instance.signOut();
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       customSnackBar(
  //         content: 'Error signing out. Try again.',
  //       ),
  //     );
  //   }
  // }

  Future<void> signOut() async {
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    final facebookLogin = FacebookLogin();
    await facebookLogin.logOut();
    _firebaseAuth.signOut();
  }

  Future<User?> signInWithFacebook() async {
    isLoading = true;
    notifyListeners();
    final fb = FacebookLogin();
    final response = await fb.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email,
    ]);
    if (response.status == FacebookLoginStatus.success) {
      final accessToken = response.accessToken!;
      final userCredential = await _firebaseAuth.signInWithCredential(
        FacebookAuthProvider.credential(accessToken.token),
      );
      // successful case
      isLoading = false;
      notifyListeners();
      return userCredential.user;
    }
    if (response.status == FacebookLoginStatus.cancel) {
      isLoading = false;
      notifyListeners();
      throw FirebaseAuthException(
        code: 'ERROR_ABORTED_BY_USER',
        message: 'Sign in aborted by user',
      );
    }
    if (response.status == FacebookLoginStatus.error) {
      isLoading = false;
      notifyListeners();
      throw FirebaseAuthException(
        code: 'ERROR_FACEBOOK_LOGIN_FAILED',
        message: response.error!.developerMessage,
      );
    }
    isLoading = false;
    notifyListeners();
    throw UnimplementedError();

  }

  Future<User?> signInWithEmailAndPassWord(String email, String password) async {
    final userCredential = await _firebaseAuth.signInWithCredential(
      EmailAuthProvider.credential(email: email, password: password),
    );
    return userCredential.user;
  }

  Future<User?> createUserWithEmailAndPassword(
      String email, String password) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return userCredential.user;
  }



  @override
  void dispose() {
    userStream?.cancel();
    super.dispose();
  }
}