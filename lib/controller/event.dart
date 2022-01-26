import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stackmybiz/model/login_model.dart';
import 'package:stackmybiz/services/email_password.dart';
import 'package:stackmybiz/view/profile.dart';

class Event {
  final auth = FirebaseAuth.instance;
  void login(LoginModel loginModel, BuildContext context) {
    EmailPasswordRegistrationLogin().login(loginModel, context);
  }

  void registration(LoginModel loginModel, BuildContext context) {
    EmailPasswordRegistrationLogin().registration(loginModel, context);
  }
}
