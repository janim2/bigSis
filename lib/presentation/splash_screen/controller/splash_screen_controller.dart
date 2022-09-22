import 'dart:async';

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
    var _duration = new Duration(seconds: 4);
    return new Timer(_duration, () {
      Get.toNamed(AppRoutes.loginRoute);
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
