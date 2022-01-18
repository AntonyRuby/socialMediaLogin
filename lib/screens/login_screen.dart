import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isGoogleLoggedIn = false;
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email'],
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SignInButton(
            Buttons.GoogleDark,
            onPressed: () {
              signInWithGoogle();
              // _showButtonPressDialog(context, 'Google (dark)');
            },
          ),
          Divider(),
          SignInButton(
            Buttons.FacebookNew,
            onPressed: () {
              // signInWithFacebook();
              // _showButtonPressDialog(context, 'FacebookNew');
            },
          ),
          Divider(),
          SignInButton(
            Buttons.Apple,
            onPressed: () {
              // _showButtonPressDialog(context, 'Apple');
            },
          ),
          Divider(),
        ],
      ),
    );
  }

  signInWithGoogle() async {
    try {
      await _googleSignIn.signIn();
      setState(() {
        _googleSignIn.currentUser != null
            ? _isGoogleLoggedIn = true
            : _isGoogleLoggedIn = false;
      });
    } catch (err) {
      print(err);
    }
  }

  // Future<UserCredential> signInWithFacebook() async {
  //   // Trigger the sign-in flow
  //   final AccessToken result = await FacebookAuth.instance.login();

  //   // Create a credential from the access token
  //   final facebookAuthCredential =
  //       FacebookAuthProvider.credential(result.token);

  //   // Once signed in, return the UserCredential
  //   return await FirebaseAuth.instance
  //       .signInWithCredential(facebookAuthCredential);
  // }
}
