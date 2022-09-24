import 'package:bigsis/presentation/homePage/homePage.dart';
import 'package:bigsis/presentation/login_screen/login_screen.dart';
import 'package:bigsis/widgets/imageCard.dart';
import 'package:bigsis/widgets/videoCard.dart';

import 'package:flutter/material.dart';
import 'package:bigsis/core/app_export.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../backend/report/addReport.dart';
import '../../widgets/defaultButton.dart';
import '../../widgets/toast.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool showSpinner = false;

  TextEditingController problemtextEdittingController = TextEditingController();

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
                    child: Form(
                      key: _formKey,
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
                          TextFormField(
                            controller: problemtextEdittingController,
                            keyboardType: TextInputType.multiline,
                            maxLines: 8,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Problem required';
                              }
                            },
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Raleway",
                                fontSize: 20),
                            decoration: InputDecoration(
                                errorStyle: TextStyle(color: Colors.white),
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
                                    fontFamily: "Raleway",
                                    color: Colors.white)),
                          ),

                          SizedBox(
                            height: 80,
                          ),
                          DefaultButton(
                            text: "Send",
                            ontap: () async {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();

                                startSpinner();
                                // Do your jobs with the validated form data.

                                var reg = await Report(
                                  context,
                                  problem: problemtextEdittingController.text,
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
}
