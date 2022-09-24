import 'package:bigsis/presentation/homePage/homePage.dart';
import 'package:bigsis/presentation/login_screen/login_screen.dart';
import 'package:bigsis/widgets/defaultButton.dart';
import 'package:bigsis/widgets/header.dart';
import 'package:bigsis/widgets/healthworkers.dart';
import 'package:bigsis/widgets/imageCard.dart';
import 'package:bigsis/widgets/pinkCircularButton.dart';
import 'package:bigsis/widgets/videoCard.dart';

import 'package:flutter/material.dart';
import 'package:bigsis/core/app_export.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../backend/volunteer/become_volunteer.dart';
import '../../widgets/toast.dart';

class JokesScreen extends StatefulWidget {
  const JokesScreen({Key? key}) : super(key: key);

  @override
  _JokesScreenState createState() => _JokesScreenState();
}

class _JokesScreenState extends State<JokesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            "assets/images/splash_bg.jpg",
            height: size.height,
            width: size.width,
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            //backgroundColor: Colors.transparent,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_outlined,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                      Header(text: "JOKES")
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(25),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Ama: If you want to see a man’s true colours, get pregnant for him.",
                          style: TextStyle(
                              fontFamily: "Raleway",
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Yaa: Because of colour I should get pregnant. ",
                          style: TextStyle(
                              fontFamily: "Raleway",
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Patient: “Doctor, doctor, I think I am losing my memory!”",
                          style: TextStyle(
                              fontFamily: "Raleway",
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Doctor: “When did that happen?”",
                          style: TextStyle(
                              fontFamily: "Raleway",
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Patient: “When did what happen?”",
                          style: TextStyle(
                              fontFamily: "Raleway",
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Why is a doctor always calm?",
                          style: TextStyle(
                              fontFamily: "Raleway",
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "They have a lot of patients.",
                          style: TextStyle(
                              fontFamily: "Raleway",
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Doctor: “I have some bad news and some very bad news.”",
                          style: TextStyle(
                              fontFamily: "Raleway",
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Patient: “Well, might as well give me the bad news first.”",
                          style: TextStyle(
                              fontFamily: "Raleway",
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Doctor: “The lab called with your test results. They said you have 24 hours to live.”",
                          style: TextStyle(
                              fontFamily: "Raleway",
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Patient: “24 HOURS! That’s terrible!! What could be worse? What’s the very bad news?”",
                          style: TextStyle(
                              fontFamily: "Raleway",
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Doctor: “I’ve been trying to reach you since yesterday.”",
                          style: TextStyle(
                              fontFamily: "Raleway",
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "When I told the doctor about my loss of memory, he made me pay in advance.",
                          style: TextStyle(
                              fontFamily: "Raleway",
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Patient: “Doctor, are the test results ready yet? I’m dying of curiosity!”",
                          style: TextStyle(
                              fontFamily: "Raleway",
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Doctor: “Heh… not only from curiosity.”",
                          style: TextStyle(
                              fontFamily: "Raleway",
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Patient: “Someone decided to graffiti my house last night!”",
                          style: TextStyle(
                              fontFamily: "Raleway",
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Doctor: “So why are you telling me?”",
                          style: TextStyle(
                              fontFamily: "Raleway",
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Patient: “I can’t understand the writing. Was it you?”",
                          style: TextStyle(
                              fontFamily: "Raleway",
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "My dermatologist was fired today.",
                          style: TextStyle(
                              fontFamily: "Raleway",
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "I’m told he made too many rash decisions.",
                          style: TextStyle(
                              fontFamily: "Raleway",
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
