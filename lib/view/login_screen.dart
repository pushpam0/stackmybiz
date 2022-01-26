import 'package:flutter/material.dart';
import 'package:stackmybiz/services/firebase_services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraint) {
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
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Email Id",
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Password",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {},
                          color: Colors.blue,
                          child: const Text("Sign In"),
                          padding: EdgeInsets.all(10),
                          minWidth: MediaQuery.of(context).size.width * 0.4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        MaterialButton(
                          onPressed: () {
                            FireBaseService().signInWithGmail(context);
                          },
                          color: Colors.white,
                          child: const Text("Sign In With Google"),
                          padding: EdgeInsets.all(10),
                          minWidth: MediaQuery.of(context).size.width * 0.4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account?"),
                            Text(
                              "Register",
                              style: TextStyle(color: Colors.green),
                            )
                          ],
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
