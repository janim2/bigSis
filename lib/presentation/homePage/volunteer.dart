import 'package:bigsis/presentation/homePage/homePage.dart';
import 'package:bigsis/presentation/login_screen/login_screen.dart';
import 'package:bigsis/widgets/defaultButton.dart';
import 'package:bigsis/widgets/healthworkers.dart';
import 'package:bigsis/widgets/imageCard.dart';
import 'package:bigsis/widgets/pinkCircularButton.dart';
import 'package:bigsis/widgets/videoCard.dart';

import 'package:flutter/material.dart';
import 'package:bigsis/core/app_export.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../backend/volunteer/become_volunteer.dart';
import '../../widgets/toast.dart';

class VolunteerScreen extends StatefulWidget {
  const VolunteerScreen({Key? key}) : super(key: key);

  @override
  _VolunteerScreenState createState() => _VolunteerScreenState();
}

class _VolunteerScreenState extends State<VolunteerScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isVisible = false;
  bool showSpinner = false;

  TextEditingController nametextEdittingController = TextEditingController();

  TextEditingController houseaddresstextEdittingController =
      TextEditingController();
  TextEditingController gpsaddressTextEdittingController =
      TextEditingController();
  TextEditingController regionTextEdittingController = TextEditingController();
  TextEditingController cityTextEdittingController = TextEditingController();
  TextEditingController phoneTextEdittingController = TextEditingController();
  TextEditingController reasonTextEdittingController = TextEditingController();
  TextEditingController hoursTextEdittingController = TextEditingController();

  @override
  void initState() {
    FetchUserDetails(context);
    super.initState();
  }

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
                        "Thank you for your interest to volunteer as a Big Sis. So we can determine if you are suitable for any open volunteering roles in the fastest time possible, please complete all of the fields below",
                        style: TextStyle(
                            fontFamily: "Raleway",
                            fontSize: 18,
                            color: ColorConstant.defaultBlue),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Your confidential data will be used only for the purpose of this application, and will not be shared with any other third party",
                        style: TextStyle(
                            fontFamily: "Raleway",
                            fontSize: 18,
                            color: ColorConstant.defaultBlue),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "If you would like to learn more about Big Sis and our mission, please go to the About section of our application or you can email all your questions to bigsis@gmail.com",
                        style: TextStyle(
                            fontFamily: "Raleway",
                            fontSize: 18,
                            color: ColorConstant.defaultBlue),
                      ),
                      SizedBox(
                        height: 10,
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
                                      color: ColorConstant.pink,
                                      fontFamily: "Raleway",
                                      fontSize: 23),
                                  decoration: InputDecoration(
                                      // border: const OutlineInputBorder(
                                      //   borderRadius: BorderRadius.all(
                                      //     Radius.circular(10.0),
                                      //   ),
                                      // ),

                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ColorConstant.defaultBlue),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ColorConstant.defaultBlue),
                                      ),
                                      filled: true,
                                      // hintStyle: textfield_hint_style,
                                      hintText: "Name:",
                                      hintStyle: TextStyle(
                                          fontFamily: "Raleway",
                                          color: ColorConstant.defaultBlue)),
                                ),
                                TextFormField(
                                  controller:
                                      houseaddresstextEdittingController,
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'House Address required';
                                    }
                                  },
                                  style: TextStyle(
                                      color: ColorConstant.pink,
                                      fontFamily: "Raleway",
                                      fontSize: 23),
                                  maxLines: 2,
                                  decoration: InputDecoration(
                                      // border: const OutlineInputBorder(
                                      //   borderRadius: BorderRadius.all(
                                      //     Radius.circular(10.0),
                                      //   ),
                                      // ),

                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ColorConstant.defaultBlue),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ColorConstant.defaultBlue),
                                      ),
                                      filled: true,
                                      // hintStyle: textfield_hint_style,
                                      hintText: "House Address:",
                                      hintStyle: TextStyle(
                                          fontFamily: "Raleway",
                                          color: ColorConstant.defaultBlue)),
                                ),
                                TextFormField(
                                  controller: gpsaddressTextEdittingController,
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'GPS Address required';
                                    }
                                  },
                                  style: TextStyle(
                                      color: ColorConstant.pink,
                                      fontFamily: "Raleway",
                                      fontSize: 23),
                                  decoration: InputDecoration(
                                      // border: const OutlineInputBorder(
                                      //   borderRadius: BorderRadius.all(
                                      //     Radius.circular(10.0),
                                      //   ),
                                      // ),

                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ColorConstant.defaultBlue),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ColorConstant.defaultBlue),
                                      ),
                                      filled: true,
                                      // hintStyle: textfield_hint_style,
                                      hintText: "GPS Address:",
                                      hintStyle: TextStyle(
                                          fontFamily: "Raleway",
                                          color: ColorConstant.defaultBlue)),
                                ),
                                TextFormField(
                                  controller: regionTextEdittingController,
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Region required';
                                    }
                                  },
                                  style: TextStyle(
                                      color: ColorConstant.pink,
                                      fontFamily: "Raleway",
                                      fontSize: 23),
                                  decoration: InputDecoration(
                                      // border: const OutlineInputBorder(
                                      //   borderRadius: BorderRadius.all(
                                      //     Radius.circular(10.0),
                                      //   ),
                                      // ),

                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ColorConstant.defaultBlue),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ColorConstant.defaultBlue),
                                      ),
                                      filled: true,
                                      // hintStyle: textfield_hint_style,
                                      hintText: "Region:",
                                      hintStyle: TextStyle(
                                          fontFamily: "Raleway",
                                          color: ColorConstant.defaultBlue)),
                                ),
                                TextFormField(
                                  controller: cityTextEdittingController,
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'City required';
                                    }
                                  },
                                  style: TextStyle(
                                      color: ColorConstant.pink,
                                      fontFamily: "Raleway",
                                      fontSize: 23),
                                  decoration: InputDecoration(
                                      // border: const OutlineInputBorder(
                                      //   borderRadius: BorderRadius.all(
                                      //     Radius.circular(10.0),
                                      //   ),
                                      // ),

                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ColorConstant.defaultBlue),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ColorConstant.defaultBlue),
                                      ),
                                      filled: true,
                                      // hintStyle: textfield_hint_style,
                                      hintText: "City:",
                                      hintStyle: TextStyle(
                                          fontFamily: "Raleway",
                                          color: ColorConstant.defaultBlue)),
                                ),
                                TextFormField(
                                  controller: phoneTextEdittingController,
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Phone required';
                                    }
                                  },
                                  style: TextStyle(
                                      color: ColorConstant.pink,
                                      fontFamily: "Raleway",
                                      fontSize: 23),
                                  decoration: InputDecoration(
                                      // border: const OutlineInputBorder(
                                      //   borderRadius: BorderRadius.all(
                                      //     Radius.circular(10.0),
                                      //   ),
                                      // ),

                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ColorConstant.defaultBlue),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ColorConstant.defaultBlue),
                                      ),
                                      filled: true,
                                      // hintStyle: textfield_hint_style,
                                      hintText: "Phone number:",
                                      hintStyle: TextStyle(
                                          fontFamily: "Raleway",
                                          color: ColorConstant.defaultBlue)),
                                ),
                                TextFormField(
                                  controller: reasonTextEdittingController,
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Reason for volunteering required';
                                    }
                                  },
                                  style: TextStyle(
                                      color: ColorConstant.pink,
                                      fontFamily: "Raleway",
                                      fontSize: 23),
                                  maxLines: 3,
                                  decoration: InputDecoration(
                                      // border: const OutlineInputBorder(
                                      //   borderRadius: BorderRadius.all(
                                      //     Radius.circular(10.0),
                                      //   ),
                                      // ),

                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ColorConstant.defaultBlue),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ColorConstant.defaultBlue),
                                      ),
                                      filled: true,
                                      // hintStyle: textfield_hint_style,
                                      hintText:
                                          "Why are you interested in volunteering:",
                                      hintStyle: TextStyle(
                                          fontFamily: "Raleway",
                                          color: ColorConstant.defaultBlue)),
                                ),
                                TextFormField(
                                  controller: hoursTextEdittingController,
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Hours per required';
                                    }
                                  },
                                  style: TextStyle(
                                      color: ColorConstant.pink,
                                      fontFamily: "Raleway",
                                      fontSize: 23),
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                      // border: const OutlineInputBorder(
                                      //   borderRadius: BorderRadius.all(
                                      //     Radius.circular(10.0),
                                      //   ),
                                      // ),

                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ColorConstant.defaultBlue),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ColorConstant.defaultBlue),
                                      ),
                                      filled: true,
                                      // hintStyle: textfield_hint_style,
                                      hintText: "Hours per week:",
                                      hintStyle: TextStyle(
                                          fontFamily: "Raleway",
                                          color: ColorConstant.defaultBlue)),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                PinkCircularButton(
                                  textonButton: "Volunteer",
                                  ontap: () async {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();

                                      startSpinner();
                                      // Do your jobs with the validated form data.

                                      var reg = await Volunteer(context,
                                          name: nametextEdittingController.text,
                                          houseaddress:
                                              houseaddresstextEdittingController
                                                  .text,
                                          gps: gpsaddressTextEdittingController
                                              .text,
                                          region:
                                              regionTextEdittingController.text,
                                          city: cityTextEdittingController.text,
                                          phone:
                                              phoneTextEdittingController.text,
                                          whyvolunteer:
                                              reasonTextEdittingController.text,
                                          hours:
                                              hoursTextEdittingController.text);
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
                              ],
                            ),
                          )),
                      // PinkCircularButton(textonButton: "Volunteer")
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

  Future<void> FetchUserDetails(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    nametextEdittingController.text = prefs.getString("fullname").toString();
    phoneTextEdittingController.text = prefs.getString("phone").toString();
  }
}
