import 'package:bigsis/core/helpers/functions.dart';
import 'package:bigsis/presentation/homePage/homePage.dart';
import 'package:bigsis/presentation/login_screen/login_screen.dart';
import 'package:bigsis/widgets/commentsCard.dart';
import 'package:bigsis/widgets/defaultButton.dart';
import 'package:bigsis/widgets/header.dart';
import 'package:bigsis/widgets/imageCard.dart';
import 'package:bigsis/widgets/pinkCircularButton.dart';
import 'package:bigsis/widgets/videoCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:bigsis/core/app_export.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../backend/chatroom/addChat.dart';
import '../../widgets/toast.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  _CommentsScreenState createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String user_id = "";
  DateTime selectedDate = DateTime.now();

  TextEditingController commenttextEdittingController = TextEditingController();
  bool _isVisible = false;
  bool showSpinner = false;

  TextEditingController emailtextEdittingController = TextEditingController();
  TextEditingController passwordTextEdittingController =
      TextEditingController();

  @override
  void initState() {
    FetchFromSharedPreferences();
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
                          controller: commenttextEdittingController,
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
                            child: PinkCircularButton(
                          textonButton: "Comment",
                          ontap: () async {
                            startSpinner();
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              var reg = await Comment(context,
                                  comment: commenttextEdittingController.text);
                              if (reg != null) {
                                stopSpinner();
                                showAlert(context, "error", reg.toString(), () {
                                  Navigator.of(context).pop();
                                });
                              }
                            }
                          },
                        ))
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
                      Header(text: "CHATROOM")
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("chatroom")
                          .snapshots(),
                      builder: (builder,
                          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                              snapshots) {
                        var dataRef = snapshots.data;

                        if (snapshots.hasError) {
                          return Text('Something went wrong');
                        }

                        if (snapshots.connectionState ==
                            ConnectionState.waiting) {
                          return Text(
                            "Loading",
                            style: TextStyle(
                                fontFamily: "Raleway",
                                fontSize: 15,
                                color: Colors.white),
                          );
                        }

                        if (snapshots.data!.docs.length == 0) {
                          return Text("No Comments",
                              style: TextStyle(
                                  fontFamily: "Raleway",
                                  fontSize: 18,
                                  color: Colors.white));
                        }

                        return Column(
                          children: [
                            for (int k = 0;
                                k <= snapshots.data!.docs.length - 1;
                                k++)
                              Container(
                                child: CommentsCard(
                                    name: dataRef?.docs[k]['commenter_name'],
                                    message: dataRef?.docs[k]['comment'],
                                    date: dateFormat(dataRef?.docs[k]['date'])),
                              ),
                          ],
                        );
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> FetchFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    user_id = prefs.getString("user_id")!;
    print(user_id);
  }
}
