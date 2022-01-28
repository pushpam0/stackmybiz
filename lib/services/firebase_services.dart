import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stackmybiz/view/profile.dart';

class FireBaseService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<String?> signInWithGmail(context) async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication? googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication!.accessToken,
          idToken: googleSignInAuthentication.idToken);
      UserCredential result =
          await firebaseAuth.signInWithCredential(authCredential);
      User? user = result.user;
      if (result.user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProfileScreen()));
      }
    } on FirebaseAuthException catch (e) {
      print(e.email);
      throw e;
    }
  }
}
