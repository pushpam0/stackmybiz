import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stackmybiz/model/login_model.dart';
import 'package:stackmybiz/services/email_password.dart';
import 'package:stackmybiz/services/firebase_services.dart';
import 'package:stackmybiz/services/reset_password.dart';

class Event {
  final auth = FirebaseAuth.instance;
  void login(LoginModel loginModel, BuildContext context) {
    EmailPasswordRegistrationLogin().login(loginModel, context);
  }

  void registration(LoginModel loginModel, BuildContext context) {
    EmailPasswordRegistrationLogin().registration(loginModel, context);
  }

  void googleLogin(context) {
    FireBaseService().signInWithGmail(context);
  }

  void resetPassword(String email, BuildContext context) {
    ResetPasswordService().resetyourpassword(email, context);
  }
}
