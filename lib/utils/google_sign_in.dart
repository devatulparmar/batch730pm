import 'package:batch730pm/utils/common_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider {
  static final GoogleSignInProvider _instance = GoogleSignInProvider._internal();

  factory GoogleSignInProvider() {
    return _instance;
  }

  GoogleSignInProvider._internal();

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: [
    "email",
  ]);

  GoogleSignIn get googleSignIn => _googleSignIn;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> signIn() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser == null) {
     return MySnackBar.showMySnackBar(
        content: 'Google sign-in cancelled.',
        backgroundColor: Colors.red,
      );
    }

    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential userCredential =
        await _auth.signInWithCredential(credential);

    return userCredential;
  }

  Future signOut() async {
    await googleSignIn.signOut();
  }

  Future<bool> isSignIn() async {
    return await googleSignIn.isSignedIn();
  }
}
