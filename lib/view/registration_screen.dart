import 'package:flutter/material.dart';
import 'package:stackmybiz/controller/event.dart';
import 'package:stackmybiz/model/login_model.dart';
import 'package:stackmybiz/services/firebase_services.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late TextEditingController email;
  late TextEditingController password;
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
          return Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: constraint.maxHeight,
              child: Column(
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
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    height: constraint.maxHeight * 0.5,
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
                        SizedBox(
                          height: 10,
                        ),
                        MaterialButton(
                          onPressed: () {
                            Event().registration(
                                LoginModel(
                                    email: email.text, password: password.text),
                                context);
                          },
                          color: Colors.blue,
                          child: const Text("Sign Up"),
                          padding: EdgeInsets.all(10),
                          minWidth: MediaQuery.of(context).size.width * 0.4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
            content: Text(message),
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
