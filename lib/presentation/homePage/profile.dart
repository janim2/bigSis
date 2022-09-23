import 'package:bigsis/presentation/homePage/homePage.dart';
import 'package:bigsis/presentation/login_screen/login_screen.dart';
import 'package:bigsis/widgets/imageCard.dart';
import 'package:bigsis/widgets/videoCard.dart';

import 'package:flutter/material.dart';
import 'package:bigsis/core/app_export.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../backend/profile/updateProfile.dart';
import '../../widgets/defaultButton.dart';
import '../../widgets/toast.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<ProfileScreen> {
  TextEditingController nameTextEdittingController = TextEditingController();
  TextEditingController emailTextEdittingController = TextEditingController();
  TextEditingController phoneTextEdittingController = TextEditingController();
  TextEditingController occupationTextEdittingController =
      TextEditingController();
  TextEditingController biographyTextEdittingController =
      TextEditingController();

  @override
  void initState() {
    FetchFromSharedPreferences();
    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isVisible = false;
  bool showSpinner = false;

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
                          margin:
                              EdgeInsets.only(bottom: 20, top: 20, right: 20),
                          width: 275,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.pink, width: 2.0),
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
                    child: Form(
                      key: _formKey,
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
                          TextFormField(
                            controller: nameTextEdittingController,
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
                          TextFormField(
                            controller: emailTextEdittingController,
                            keyboardType: TextInputType.text,
                            obscureText: false,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Email required';
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
                          TextFormField(
                            controller: phoneTextEdittingController,
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Phone required';
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
                                    fontFamily: "Raleway",
                                    color: Colors.white)),
                          ),
                          TextFormField(
                            controller: occupationTextEdittingController,
                            keyboardType: TextInputType.text,
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
                                hintText: "Occupation:",
                                hintStyle: TextStyle(
                                    fontFamily: "Raleway",
                                    color: Colors.white)),
                          ),
                          TextFormField(
                            controller: biographyTextEdittingController,
                            keyboardType: TextInputType.text,
                            maxLines: 5,
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
                                hintText: "Biography:",
                                hintStyle: TextStyle(
                                    fontFamily: "Raleway",
                                    color: Colors.white)),
                          ),
                          SizedBox(
                            height: 80,
                          ),
                          DefaultButton(
                            text: "Update",
                            ontap: () async {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();

                                startSpinner();
                                // Do your jobs with the validated form data.

                                var reg = await UpdateProfile(
                                  context,
                                  email: emailTextEdittingController.text,
                                  name: nameTextEdittingController.text,
                                  phone: phoneTextEdittingController.text,
                                  occupation:
                                      occupationTextEdittingController.text,
                                  biography:
                                      biographyTextEdittingController.text,
                                );
                                if (reg != null) {
                                  stopSpinner();
                                  showAlert(context, "error", reg.toString(),
                                      () {
                                    Navigator.of(context).pop();
                                  });
                                }
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> FetchFromSharedPreferences() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      nameTextEdittingController.text = pref.getString("fullname").toString();
      emailTextEdittingController.text = pref.getString("email").toString();
      phoneTextEdittingController.text = pref.getString("phone") ?? "";
      occupationTextEdittingController.text =
          pref.getString("occupation") ?? "";
      biographyTextEdittingController.text = pref.getString("biography") ?? "";
    });
  }
}
