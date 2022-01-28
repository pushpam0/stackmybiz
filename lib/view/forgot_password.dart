import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stackmybiz/controller/event.dart';
import 'package:stackmybiz/model/login_model.dart';
import 'package:stackmybiz/model/reg_exp.dart';
import 'package:stackmybiz/provider/provider_model.dart';
import 'package:stackmybiz/view/profile.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late TextEditingController email;

  String error = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    email = TextEditingController();
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
                    // height: constraint.maxHeight * 0.5,
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
                        Text(
                          error,
                          style: TextStyle(color: Colors.red),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        MaterialButton(
                          onPressed: () {
                            if (CheckEmailFormat()
                                .checkFormat(email.text.trim())) {
                              Event().resetPassword(email.text.trim(), context);

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
                                              Provider.of<ProviderModel>(
                                                      context,
                                                      listen: false)
                                                  .messageOnDilog(
                                                null,
                                              );

                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const ProfileScreen()),
                                              );
                                              // Navigator.of(context).pop();
                                            },
                                          )
                                        ],
                                      );
                                    });
                                  });
                            } else {
                              setState(() {
                                error = "enter valid email";
                              });
                            }
                          },
                          color: Colors.blue,
                          child: const Text("Send reset link"),
                          padding: EdgeInsets.all(10),
                          minWidth: MediaQuery.of(context).size.width * 0.8,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
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
}
