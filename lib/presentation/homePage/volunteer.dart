import 'package:bigsis/presentation/homePage/homePage.dart';
import 'package:bigsis/presentation/login_screen/login_screen.dart';
import 'package:bigsis/widgets/defaultButton.dart';
import 'package:bigsis/widgets/healthworkers.dart';
import 'package:bigsis/widgets/imageCard.dart';
import 'package:bigsis/widgets/pinkCircularButton.dart';
import 'package:bigsis/widgets/videoCard.dart';

import 'package:flutter/material.dart';
import 'package:bigsis/core/app_export.dart';

class VolunteerScreen extends StatefulWidget {
  const VolunteerScreen({Key? key}) : super(key: key);

  @override
  _VolunteerScreenState createState() => _VolunteerScreenState();
}

class _VolunteerScreenState extends State<VolunteerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            "assets/images/homepage_bg.jpg",
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
                          color: ColorConstant.pink,
                          size: 35,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 20, top: 20, right: 20),
                        width: 275,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.pink, width: 2.0),
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  'Volunteer',
                                  style: TextStyle(
                                      color: Colors.pink,
                                      fontFamily: "Raleway",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(25),
                  child: Column(
                    children: [
                      Text(
                        "BigSis is passionate about the sexual health of females. A lot needs to be done in order to educate women on how to effectively take care of themselves. More hands are needed.",
                        style: TextStyle(
                            fontFamily: "Raleway",
                            fontSize: 20,
                            color: ColorConstant.defaultBlue),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "We are more than grateful to have you as a volunteer",
                        style: TextStyle(
                            fontFamily: "Raleway",
                            fontSize: 20,
                            color: ColorConstant.defaultBlue),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Click to volunteer. We would get back to you shortly after. There is a lot to do",
                        style: TextStyle(
                            fontFamily: "Raleway",
                            fontSize: 20,
                            color: ColorConstant.defaultBlue),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      PinkCircularButton(textonButton: "Volunteer")
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
