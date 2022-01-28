import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stackmybiz/controller/event.dart';
import 'package:stackmybiz/model/login_model.dart';
import 'package:stackmybiz/model/reg_exp.dart';
import 'package:stackmybiz/provider/provider_model.dart';
import 'package:stackmybiz/view/forgot_password.dart';
import 'package:stackmybiz/view/registration_screen.dart';

import 'profile.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController email;
  late TextEditingController password;
  String error = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    email = TextEditingController();
    password = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(builder: (contextt, constraint) {
          return SizedBox(
            height: constraint.maxHeight,
            child: ListView(
              children: [
                Container(
                  height: constraint.maxHeight * 0.2,
                  child: Center(
                    child: Image.asset("assets/stack.png"),
                  ),
                ),
                Column(
                  children: const [
                    Text(
                      "We Stack Your Idea Into Successful Biz",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    // ignore: prefer_const_constructors
                    Text(
                      "Let's take a successful stacking journey together.",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                    )
                  ],
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    // height: constraint.maxHeight * 0.7,
                    //  color: Colors.red[300],
                    child: Column(
                      children: [
                        TextField(
                          controller: email,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Email Id",
                          ),
                        ),
                        Text(error),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: password,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Password",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ForgotPasswordScreen()),
                                );
                              },
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {
                            if (CheckEmailFormat()
                                .checkFormat(email.text.trim())) {
                              Event().login(
                                  LoginModel(
                                      email: email.text.trim(),
                                      password: password.text.trim()),
                                  context);
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Consumer<ProviderModel>(
                                        builder: (context, model, child) {
                                      return AlertDialog(
                                        title: Text("Message"),
                                        content: (model.message == null)
                                            ? CircularProgressIndicator()
                                            : Text(model.message.toString()),
                                        actions: [
                                          TextButton(
                                            child: Text("Ok"),
                                            onPressed: () {
                                              if (model.message.toString() !=
                                                      "No user found for that email." &&
                                                  model.message.toString() !=
                                                      "Wrong password provided for that user") {
                                                Provider.of<ProviderModel>(
                                                        context,
                                                        listen: false)
                                                    .messageOnDilog(null);
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const ProfileScreen()),
                                                );
                                              } else {
                                                Navigator.pop(context);
                                              }

                                              // Navigator.of(context).pop();
                                            },
                                          )
                                        ],
                                      );
                                    });
                                  });
                            } else {
                              setState(() {
                                error = "email is not valid";
                              });
                            }
                          },
                          color: Colors.blue,
                          child: const Text("Sign In"),
                          padding: EdgeInsets.all(10),
                          minWidth: MediaQuery.of(context).size.width * 0.8,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        MaterialButton(
                          onPressed: () {
                            //FireBaseService().signInWithGmail(context);
                            Event().googleLogin(context);
                          },
                          color: Colors.white,
                          child: const Text("Sign In With Google"),
                          padding: EdgeInsets.all(10),
                          minWidth: MediaQuery.of(context).size.width * 0.8,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const RegistrationScreen(),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have an account?"),
                              Text(
                                "Register",
                                style: TextStyle(color: Colors.green),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  void showMessage(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: (message == "provided email or password incorrect")
                ? Text(message)
                : CircularProgressIndicator(),
            actions: [
              TextButton(
                child: Text("Ok"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
