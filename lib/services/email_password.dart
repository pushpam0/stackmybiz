import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stackmybiz/model/login_model.dart';
import 'package:stackmybiz/provider/provider_model.dart';
import 'package:stackmybiz/view/profile.dart';
import 'package:stackmybiz/view/widget/show_dilog.dart';

class EmailPasswordRegistrationLogin {
  Future<void> registration(LoginModel loginModel, context) async {
    // UserCredential userCredential=await auth.createUserWithEmailAndPassword(email: loginModel.email, password:loginModel.password);
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: loginModel.email,
        password: loginModel.password,
      );
      User? user = FirebaseAuth.instance.currentUser;
      await user!.sendEmailVerification();

      Provider.of<ProviderModel>(context, listen: false).messageOnDilog(
        "Verification link sent on your email id please verify your email id!",
      );
      // showMessage("user created successful", context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Provider.of<ProviderModel>(context, listen: false)
            .messageOnDilog('weak-password');
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Provider.of<ProviderModel>(context, listen: false)
            .messageOnDilog('email-already-in-use');
        print('The account already exists for that email.');
      }
    } catch (e) {
      Provider.of<ProviderModel>(context, listen: false)
          .messageOnDilog(e.toString());
      print(e);
    }
  }

  Future<void> login(LoginModel loginModel, context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: loginModel.email,
        password: loginModel.password,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Provider.of<ProviderModel>(context, listen: false).messageOnDilog(
          "No user found for that email.",
        );
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Provider.of<ProviderModel>(context, listen: false).messageOnDilog(
          "Wrong password provided for that user",
        );
        print('Wrong password provided for that user.');
      }
    }
  }
}
