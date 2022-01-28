import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stackmybiz/provider/provider_model.dart';

class ResetPasswordService {
  Future<void> resetyourpassword(String email, BuildContext context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Provider.of<ProviderModel>(context, listen: false)
          .messageOnDilog("reset link is sent on you registered email id !");
    } on FirebaseAuthException catch (e) {
      Provider.of<ProviderModel>(context, listen: false).messageOnDilog(e.code);
    } catch (e) {
      Provider.of<ProviderModel>(context, listen: false)
          .messageOnDilog(e.toString());
    }
  }
}
