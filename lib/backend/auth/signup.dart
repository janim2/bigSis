import 'package:bigsis/backend/auth/login.dart';
import 'package:bigsis/presentation/login_screen/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:bigsis/widgets/toast.dart';

import '../../../core/app_export.dart';
import '../../../routes/app_routes.dart';

Future<String?> SignUp(BuildContext context,
    {required fullname,
    required String email,
    required String password}) async {
  String errorMessage = "";
  String user_id = "";

  try {
    UserCredential result = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    user_id = result.user!.uid;

    var userAdd =
        await addUser(context, "", user_id, fullname, email, password);
  } on FirebaseAuthException catch (e) {
    switch (e.code) {
      case "invalid-email":
        errorMessage = "Your email appears to be malformed.";
        break;
      case "email-already-in-use":
        errorMessage = "Email already exists.";
        break;
      case "unknown":
        errorMessage = "Something unexcepted happened";
        break;
      case "ERROR_USER_DISABLED":
        errorMessage = "User with this email has been disabled.";
        break;
      case "ERROR_TOO_MANY_REQUESTS":
        errorMessage = "Too many requests. Try again later.";
        break;
      case "ERROR_OPERATION_NOT_ALLOWED":
        errorMessage = "Signing in with Email and Password is not enabled.";
        break;
      default:
        errorMessage = "An undefined Error happened.";
    }
    return (errorMessage);
  }
}

addUser(BuildContext context, String profile_image, String user_id,
    String fullname, String email, String password) async {
  DocumentReference documentReferencer =
      FirebaseFirestore.instance.collection("users").doc(user_id);

  Map<String, dynamic> data = <String, dynamic>{
    "image": profile_image.isEmpty ? "" : profile_image,
    "user_id": user_id,
    "fullname": fullname,
    "email": email,
    "phone": "",
    "occupation": "",
    "biography": ""
  };

  await documentReferencer
      .set(data)
      .then((value) => success(context))
      .catchError((e) => print(e));
}

success(BuildContext context) {
  showToast("Sign In to Continue");
  Get.offNamedUntil(AppRoutes.loginRoute, (route) => false);
}
