import 'package:flutter/material.dart';
import 'package:stackmybiz/model/profile_details_model.dart';
import 'package:stackmybiz/services/get_user_details.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? email = "pushpam@gmail.com";
  String? username = "not available";
  String? imagelink;
  bool isverify = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCall();
  }

  fetchCall() async {
    ProfileDetailsModel profileDetailsModel = await GetUserDetails().getUser();
    setState(() {
      if (profileDetailsModel.email != null) {
        email = profileDetailsModel.email;
      }
      if (profileDetailsModel.username != null) {
        username = profileDetailsModel.username;
      }
      if (profileDetailsModel.profileLink != null) {
        imagelink = profileDetailsModel.profileLink;
      }
      if (profileDetailsModel.checkverify != false) {
        isverify = profileDetailsModel.checkverify;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        color: Colors.white,
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: (MediaQuery.of(context).size.height -
                          MediaQuery.of(context).padding.top) *
                      0.4,
                  color: Colors.white,
                  child: LayoutBuilder(builder: (context, constraint) {
                    return Column(
                      children: [
                        Container(
                          height: constraint.maxHeight * 0.5,
                          child: Image.asset("assets/stack.png"),
                        ),
                        Container(
                          height: constraint.maxHeight * 0.2,
                          child: Column(
                            children: [
                              Text(
                                "We Stack Your Idea Into Successful Biz",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              // ignore: prefer_const_constructors
                              Text(
                                "Let's take a successful stacking journey together.",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: constraint.maxHeight * 0.3,
                          child: Text(
                            "34:09",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                        )
                      ],
                    );
                  }),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: (MediaQuery.of(context).size.height -
                          MediaQuery.of(context).padding.top) *
                      0.6,
                  width: MediaQuery.of(context).size.width * 1,
                  //color: Colors.white,
                  decoration: BoxDecoration(
                    color: Colors.blue[300],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: LayoutBuilder(builder: (context, constraint) {
                    return Column(
                      children: [
                        Container(
                          height: constraint.maxHeight * 0.3,
                          child: (imagelink != null)
                              ? CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(imagelink.toString()),
                                  backgroundColor: Colors.transparent,
                                  maxRadius: 50,
                                )
                              : CircleAvatar(
                                  child: Text("NA"),
                                  backgroundColor: Colors.red,
                                  maxRadius: 50,
                                ),
                        ),
                        Container(
                          height: constraint.maxHeight * 0.3,
                          child: Column(
                            children: [
                              Text(
                                email.toString(),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                username.toString(),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              isverify == true
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Verified",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.yellow),
                                        ),
                                        Icon(
                                          Icons.check,
                                          color: Colors.yellow,
                                        ),
                                      ],
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Not Verified",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red),
                                        ),
                                        Icon(
                                          Icons.check,
                                        ),
                                      ],
                                    ),
                            ],
                          ),
                        )
                      ],
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
