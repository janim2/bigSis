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

Future<String?> Report(BuildContext context, {required problem}) async {
  String errorMessage = "";
  String user_id = "";

  SharedPreferences prefs = await SharedPreferences.getInstance();

  print("reporting");
  DocumentReference documentReferencer =
      FirebaseFirestore.instance.collection("reports").doc(getAutoId());

  Map<String, dynamic> data = <String, dynamic>{
    "responded_to": 0,
    "problem": problem,
    "reporter_id": prefs.getString('user_id'),
    "reporter_name": prefs.getString('fullname'),
    "date": currentTimestamp(),
  };

  await documentReferencer
      .set(data)
      .then((value) => success(context))
      .catchError((e) => print(e));
}

success(BuildContext context) {
  showToast("Problem has been recieved. You will be contacted shortly");
  Get.back();
}
