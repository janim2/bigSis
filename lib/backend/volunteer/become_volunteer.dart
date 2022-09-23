import 'package:bigsis/backend/auth/login.dart';
import 'package:bigsis/core/helpers/functions.dart';
import 'package:bigsis/presentation/login_screen/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:bigsis/widgets/toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/app_export.dart';

Future<String?> Volunteer(BuildContext context,
    {required String name,
    required String houseaddress,
    required String gps,
    required String region,
    required String city,
    required String phone,
    required String whyvolunteer,
    required String hours}) async {
  String errorMessage = "";
  String user_id = "";

  SharedPreferences prefs = await SharedPreferences.getInstance();
  final User? currentUser = FirebaseAuth.instance.currentUser;
  user_id = currentUser!.uid;

  DocumentReference documentReferencer =
      FirebaseFirestore.instance.collection("volunteers").doc(getAutoId());

  Map<String, dynamic> data = <String, dynamic>{
    "name": name,
    "volunteer_id": user_id,
    "address": houseaddress,
    "gps_address": gps,
    "region": region,
    "city": city,
    "phone": phone,
    "reason": whyvolunteer,
    "hours": hours,
    "date": currentTimestamp(),
  };

  await documentReferencer
      .set(data)
      .then((value) => success(context))
      .catchError((e) => print(e));
}

success(BuildContext context) {
  Get.back();
  // showAlert(context, "Success",
  //     "Volunteer request recieved. You will be contacted shortly", () {
  //   Navigator.of(context).pop();
  // });
  showToast("You will be contacted shortly");
}
