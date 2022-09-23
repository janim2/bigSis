import 'package:bigsis/presentation/homePage/homePage.dart';
import 'package:bigsis/widgets/toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../core/app_export.dart';

Future<String?> Login(BuildContext context,
    {required String email, required String password}) async {
  String errorMessage = "";
  String user_id = "";

  try {
    UserCredential result = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    assert(result != null);
    final User? currentUser = FirebaseAuth.instance.currentUser;
    user_id = currentUser!.uid;

    //fetch user details
    FetchUserDetails(context, user_id);
  } on FirebaseAuthException catch (e) {
    switch (e.code) {
      case "invalid-email":
        errorMessage = "Your phone number appears to be malformed.";
        break;
      case "wrong-password":
        errorMessage = "Your password is wrong.";
        break;
      case "user-not-found":
        errorMessage = "User with this email doesn't exist.";
        break;
      case "network-request-failed":
        errorMessage = "Request is taking too long to respond";
        break;
      case "ERROR_USER_DISABLED":
        errorMessage = "User with this email has been disabled.";
        break;
      case "ERROR_TOO_MANY_REQUESTS":
        errorMessage = "Too many requests. Try again later.";
        break;
      default:
        errorMessage = "An undefined Error happened.";
    }
    return errorMessage;
  }
}

Future FetchUserDetails(BuildContext context, String user_id) async {
  await FirebaseFirestore.instance
      .collection('users')
      .doc(user_id)
      .get()
      .then((DocumentSnapshot documentSnapshot) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //save to shared preference
    saveToPrefs(prefs, documentSnapshot);
    Get.offNamedUntil(AppRoutes.homeRoute, (route) => false);
    showToast("Welcome to BigSis");
  });
}

saveToPrefs(SharedPreferences prefs, DocumentSnapshot documentSnapshot) {
  prefs.setString("hasLoggedin", "true");
  prefs.setString("profile_image", documentSnapshot.get("image"));
  prefs.setString("fullname", documentSnapshot.get("fullname"));
  prefs.setString("user_id", documentSnapshot.get("user_id"));
  prefs.setString("email", documentSnapshot.get("email"));
  // prefs.setString("phonenumber", documentSnapshot.get("phone"));
}
