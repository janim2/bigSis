import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/app_export.dart';
import '../../widgets/toast.dart';

Future<String?> UpdateProfile(BuildContext context,
    {required String email,
    required String phone,
    required String name,
    required String occupation,
    required String biography}) async {
  final User? currentUser = await FirebaseAuth.instance.currentUser;

  String user_id = currentUser!.uid;

  print("email $email");
  DocumentReference documentReferencer =
      FirebaseFirestore.instance.collection("users").doc(user_id);

  Map<String, dynamic> data = <String, dynamic>{
    "fullname": name,
    "phone": phone,
    "email": email,
    "occupation": occupation,
    "biography": biography
  };

  await documentReferencer
      .update(data)
      .then((value) => success(name, phone, email, occupation, biography))
      .catchError((e) => print(e));
}

success(String name, String phone, String email, String occupation,
    String biography) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("fullname", name);
  prefs.setString("phone", phone);
  prefs.setString("email", email);
  prefs.setString("occupation", occupation);
  prefs.setString("biography", biography);
  Get.back();
  showToast("Profile updated successful");
}
