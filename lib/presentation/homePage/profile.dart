import 'package:bigsis/presentation/homePage/homePage.dart';
import 'package:bigsis/presentation/login_screen/login_screen.dart';
import 'package:bigsis/widgets/imageCard.dart';
import 'package:bigsis/widgets/videoCard.dart';

import 'package:flutter/material.dart';
import 'package:bigsis/core/app_export.dart';

import '../../widgets/defaultButton.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<ProfileScreen> {
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
                                  'PROFILE',
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
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(
                          "assets/images/userFemale.png",
                          height: 150.0,
                          width: 150.0,
                        ),
                      ),
                      TextField(
                        // controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
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
                            hintText: "Name:",
                            hintStyle: TextStyle(
                                fontFamily: "Raleway", color: Colors.white)),
                      ),
                      TextField(
                        // controller: passwordController,
                        keyboardType: TextInputType.text,
                        obscureText: false,
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
                            hintText: "Email:",
                            hintStyle: TextStyle(
                                fontFamily: "Raleway", color: Colors.white)),
                      ),
                      TextField(
                        // controller: passwordController,
                        keyboardType: TextInputType.phone,
                        obscureText: false,
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
                            hintText: "Phone:",
                            hintStyle: TextStyle(
                                fontFamily: "Raleway", color: Colors.white)),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      DefaultButton(text: "Update"),
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
