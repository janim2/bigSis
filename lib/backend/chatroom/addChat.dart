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

Future<String?> Comment(BuildContext context, {required comment}) async {
  String errorMessage = "";
  String user_id = "";

  SharedPreferences prefs = await SharedPreferences.getInstance();
  final User? currentUser = FirebaseAuth.instance.currentUser;
  user_id = currentUser!.uid;

  DocumentReference documentReferencer =
      FirebaseFirestore.instance.collection("chatroom").doc(getAutoId());

  Map<String, dynamic> data = <String, dynamic>{
    "comment": comment,
    "commenter_id": user_id,
    "commenter_name": prefs.getString('fullname'),
    "date": currentTimestamp(),
  };

  await documentReferencer
      .set(data)
      .then((value) => success(context))
      .catchError((e) => print(e));
}

success(BuildContext context) {
  showToast("Comment added successfully");
  Navigator.of(context).pop();
}
