import 'package:bigsis/presentation/homePage/homePage.dart';
import 'package:bigsis/presentation/login_screen/login_screen.dart';
import 'package:bigsis/widgets/imageCard.dart';
import 'package:bigsis/widgets/videoCard.dart';

import 'package:flutter/material.dart';
import 'package:bigsis/core/app_export.dart';

import '../../widgets/defaultButton.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
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
                                  'REPORT PROBLEM',
                                  style: TextStyle(
                                      color: Colors.pink,
                                      fontFamily: "Raleway",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
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
                      // ClipRRect(
                      //   borderRadius: BorderRadius.circular(10.0),
                      //   child: Image.asset(
                      //     "assets/images/userFemale.png",
                      //     height: 150.0,
                      //     width: 150.0,
                      //   ),
                      // ),

                      Text(
                        'Talk to me. Any problem down there?',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Raleway"),
                      ),
                      Text(
                        'An expert will help you find a solution',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Raleway"),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      TextField(
                        // controller: passwordController,
                        keyboardType: TextInputType.multiline,
                        maxLines: 8,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Raleway",
                            fontSize: 23),
                        decoration: InputDecoration(
                            // border: const OutlineInputBorder(
                            //   borderRadius: BorderRadius.all(
                            //     Radius.circular(10.0),
                            //   ),
                            // ),

                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            filled: true,
                            // hintStyle: textfield_hint_style,
                            hintText: "What is your problem?",
                            hintStyle: TextStyle(
                                fontFamily: "Raleway", color: Colors.white)),
                      ),

                      SizedBox(
                        height: 80,
                      ),
                      DefaultButton(text: "Send"),
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
