import 'dart:async';

import 'package:bigsis/presentation/homePage/homePage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/core/app_export.dart';
import 'package:bigsis/presentation/splash_screen/models/splash_model.dart';

class SplashScreenController extends GetxController {
  Rx<SplashModel> splashOneModelObj = SplashModel().obs;

  @override
  void onInit() {
    super.onInit();
    startTime();
  }

  startTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var hasLogedin = prefs.getString("hasLoggedin");
    var _duration = new Duration(seconds: 4);
    return Timer(_duration, () {
      if (hasLogedin != "true") {
        Get.offNamedUntil(AppRoutes.loginRoute, (route) => false);
      } else {
        Get.offNamedUntil(AppRoutes.homeRoute, (route) => false);
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
