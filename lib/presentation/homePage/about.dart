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

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            "assets/images/bg_3.jpg",
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
                      Header(text: "ABOUT")
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(25),
                  child: Column(
                    children: [
                      Text(
                        "Version 1.0",
                        style: TextStyle(
                            fontFamily: "Raleway",
                            fontSize: 18,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Big Sis is a low fidelity prototype mobile application for women sexual health, its problems and other related issues. Its main objective is to inform, educate and reform women attitude to sexual healthcare.",
                        style: TextStyle(
                            fontFamily: "Raleway",
                            fontSize: 18,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "It is dedicated women out there who care to know more about their sexual health, to men who support women out there and to all female activists who stand for women empowerment and the right for women to know about their sexual health.",
                        style: TextStyle(
                            fontFamily: "Raleway",
                            fontSize: 18,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Atsutse Rita Esenam Adzo \nWuddah Gifty Korlekie \nAsirifi George Oppong \nKyeremateng Evans",
                        style: TextStyle(
                            fontFamily: "Raleway",
                            fontSize: 18,
                            color: Colors.white),
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
