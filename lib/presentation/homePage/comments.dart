import 'package:bigsis/presentation/homePage/homePage.dart';
import 'package:bigsis/presentation/login_screen/login_screen.dart';
import 'package:bigsis/widgets/commentsCard.dart';
import 'package:bigsis/widgets/defaultButton.dart';
import 'package:bigsis/widgets/imageCard.dart';
import 'package:bigsis/widgets/pinkCircularButton.dart';
import 'package:bigsis/widgets/videoCard.dart';

import 'package:flutter/material.dart';
import 'package:bigsis/core/app_export.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  _CommentsScreenState createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 16,
                child: Form(
                  key: _formKey,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        SizedBox(height: 20),
                        Center(
                            child: Text(
                          'Add Comment',
                          style: TextStyle(fontFamily: "Raleway", fontSize: 18),
                        )),

                        SizedBox(height: 20),

                        TextFormField(
                          // controller: purposetextEdittingController,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(20.0),
                              // border: const OutlineInputBorder(
                              //   borderRadius: BorderRadius.all(
                              //     Radius.circular(50.0),
                              //   ),
                              // ),

                              // hintStyle: textfield_hint_style,
                              hintText: "Write comment here:",
                              hintStyle: TextStyle(
                                  fontFamily: "Raleway",
                                  color: ColorConstant.defaultBlue)),
                          maxLines: 4,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'comment required';
                            }
                          },
                          style: TextStyle(
                              color: ColorConstant.defaultBlue,
                              fontFamily: "Raleway"),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Center(
                            child: PinkCircularButton(textonButton: "Comment"))
                        // DefaultButton(
                        //   textonButton: "Book",
                        //   ontap: () async {
                        //     startSpinner();
                        //     if (_formKey.currentState!.validate()) {
                        //       _formKey.currentState!.save();
                        //       var reg = await BookApointment(context,
                        //           date: selectedDate,
                        //           purpose: purposetextEdittingController.text,
                        //           doctor_id: doctor_id,
                        //           doc_name: name,
                        //           patient_name: patient_name);
                        //       if (reg != null) {
                        //         stopSpinner();
                        //         showAlert(context, "error", reg.toString(), () {
                        //           Navigator.of(context).pop();
                        //         });
                        //       }
                        //     }
                        //   },
                        // )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        backgroundColor: ColorConstant.defaultBlue,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
                                  'COMMENTS',
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
                      CommentsCard(
                          name: "Dr.John",
                          message:
                              "I'm trying to create a simple widget test in Flutter. I have a custom widget that receives some values, composes a string and shows a Text with that string.",
                          date: "30th Sep, 2022 - 18:26"),
                      CommentsCard(
                          name: "Sarah Bannes",
                          message:
                              "I'm trying to create a simple widget test in Flutter. I have a custom widget that receives some values, composes a string and shows a Text with that string.",
                          date: "30th Sep, 2022 - 19:26"),
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
