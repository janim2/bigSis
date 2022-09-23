import 'package:bigsis/backend/auth/signup.dart';
import 'package:bigsis/presentation/homePage/homePage.dart';
import 'package:bigsis/presentation/login_screen/login_screen.dart';
import 'package:bigsis/widgets/defaultButton.dart';

import 'package:flutter/material.dart';
import 'package:bigsis/core/app_export.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../widgets/toast.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isVisible = false;
  bool showSpinner = false;

  TextEditingController nametextEdittingController = TextEditingController();

  TextEditingController emailtextEdittingController = TextEditingController();
  TextEditingController passwordTextEdittingController =
      TextEditingController();
  TextEditingController confirmpasswordTextEdittingController =
      TextEditingController();

  void updateStatus() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void stopSpinner() {
    setState(() {
      showSpinner = false;
    });
  }

  void startSpinner() {
    setState(() {
      showSpinner = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Stack(
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
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: nametextEdittingController,
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Name required';
                                    }
                                  },
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
                                      errorStyle:
                                          TextStyle(color: Colors.white),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      filled: true,
                                      // hintStyle: textfield_hint_style,
                                      hintText: "Name:",
                                      hintStyle: TextStyle(
                                          fontFamily: "Raleway",
                                          color: Colors.white)),
                                ),
                                TextFormField(
                                  controller: emailtextEdittingController,
                                  keyboardType: TextInputType.emailAddress,
                                  obscureText: false,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Email required';
                                    } else if (!value.contains("@")) {
                                      return 'Enter valid email';
                                    } else if (!value.contains(".")) {
                                      return 'Enter valid email';
                                    }
                                  },
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
                                      errorStyle:
                                          TextStyle(color: Colors.white),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      filled: true,
                                      // hintStyle: textfield_hint_style,
                                      hintText: "Email:",
                                      hintStyle: TextStyle(
                                          fontFamily: "Raleway",
                                          color: Colors.white)),
                                ),
                                TextFormField(
                                  controller: passwordTextEdittingController,
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: _isVisible ? false : true,
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
                                    errorStyle: TextStyle(color: Colors.white),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    filled: true,
                                    // hintStyle: textfield_hint_style,
                                    hintText: "Password:",
                                    hintStyle: TextStyle(
                                        fontFamily: "Raleway",
                                        color: Colors.white),
                                    suffixIcon: IconButton(
                                      onPressed: () => updateStatus(),
                                      icon: Icon(
                                          _isVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller:
                                      confirmpasswordTextEdittingController,
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: _isVisible ? false : true,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Password required';
                                    } else if (value.length < 6) {
                                      return 'Password length must be greater than 6';
                                    } else if (passwordTextEdittingController
                                            .text !=
                                        value) {
                                      return "Password mismatch";
                                    }
                                  },
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
                                    errorStyle: TextStyle(color: Colors.white),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    filled: true,
                                    // hintStyle: textfield_hint_style,
                                    hintText: "Confirm Password:",
                                    hintStyle: TextStyle(
                                        fontFamily: "Raleway",
                                        color: Colors.white),
                                    suffixIcon: IconButton(
                                      onPressed: () => updateStatus(),
                                      icon: Icon(
                                          _isVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 80,
                                ),
                                DefaultButton(
                                  text: "Sign Up",
                                  ontap: () async {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();

                                      startSpinner();
                                      // Do your jobs with the validated form data.

                                      var reg = await SignUp(
                                        context,
                                        email: emailtextEdittingController.text,
                                        password:
                                            passwordTextEdittingController.text,
                                        fullname:
                                            nametextEdittingController.text,
                                      );
                                      if (reg != null) {
                                        stopSpinner();
                                        showAlert(
                                            context, "error", reg.toString(),
                                            () {
                                          Navigator.of(context).pop();
                                        });
                                      }
                                    }
                                  },
                                ),
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
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
