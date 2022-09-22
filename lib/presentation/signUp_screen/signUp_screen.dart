import 'package:bigsis/presentation/homePage/homePage.dart';
import 'package:bigsis/presentation/login_screen/login_screen.dart';
import 'package:bigsis/widgets/defaultButton.dart';

import 'package:flutter/material.dart';
import 'package:bigsis/core/app_export.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
            child: Container(
              width: size.width,
              child: //SingleChildScrollView
                  Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Image.asset(
                      "assets/images/logo_2.png",
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                        height: size.height,
                        width: size.width,
                        margin: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Column(
                          children: [
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
                                      fontFamily: "Raleway",
                                      color: Colors.white)),
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
                                      fontFamily: "Raleway",
                                      color: Colors.white)),
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
                                  hintText: "Password:",
                                  hintStyle: TextStyle(
                                      fontFamily: "Raleway",
                                      color: Colors.white)),
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
                                  hintText: "Confirm Password:",
                                  hintStyle: TextStyle(
                                      fontFamily: "Raleway",
                                      color: Colors.white)),
                            ),
                            SizedBox(
                              height: 80,
                            ),
                            DefaultButton(text: "Sign Up"),
                            Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen()));
                                  },
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      "Already have an account? Login",
                                      style: TextStyle(
                                          fontFamily: "Raleway",
                                          fontSize: 16,
                                          color: Colors.white),
                                    ),
                                  ),
                                )),
                          ],
                        ))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
