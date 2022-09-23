import 'package:bigsis/presentation/homePage/homePage.dart';
import 'package:bigsis/presentation/signUp_screen/signUp_screen.dart';
import 'package:bigsis/widgets/defaultButton.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../backend/auth/login.dart';
import '../../widgets/toast.dart';
import 'controller/login_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:bigsis/core/app_export.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isVisible = false;
  bool showSpinner = false;

  TextEditingController emailtextEdittingController = TextEditingController();
  TextEditingController passwordTextEdittingController =
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
                    Column(
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
                                controller: emailtextEdittingController,
                                keyboardType: TextInputType.text,
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
                                    hintText: "Email:",
                                    hintStyle: TextStyle(
                                        fontFamily: "Raleway",
                                        color: Colors.white)),
                              ),
                              TextFormField(
                                controller: passwordTextEdittingController,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: _isVisible ? false : true,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Password required';
                                  } else if (value.length < 6) {
                                    return 'Password length must be greater than 6';
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
                              GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => HomePage()));
                                  },
                                  child: DefaultButton(
                                    text: "Log in",
                                    ontap: () async {
                                      if (_formKey.currentState!.validate()) {
                                        _formKey.currentState!.save();

                                        startSpinner();
                                        // Do your jobs with the validated form data.

                                        var reg = await Login(
                                          context,
                                          email:
                                              emailtextEdittingController.text,
                                          password:
                                              passwordTextEdittingController
                                                  .text,
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
                                  )),
                              Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SignUpPage()));
                                    },
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        "Don't have an account?, Sign Up",
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
          ],
        ),
      ),
    );
  }
}
