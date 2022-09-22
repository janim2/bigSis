import 'package:get/get.dart';

import '../presentation/login_screen/binding/login_screen_binding.dart';
import '../presentation/login_screen/login_screen.dart';
import '../presentation/splash_screen/binding/splash_screen_binding.dart';
import '../presentation/splash_screen/splash_screen.dart';

class AppRoutes {
  static String initialRoute = '/initialRoute';

  static String loginRoute = '/loginRoute';

  static List<GetPage> pages = [
     GetPage(
      name: loginRoute,
      page: () => LoginScreen(),
      bindings: [
        LoginScreenBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => SplashScreen(),
      bindings: [
        SplashScreenBinding(),
      ],
    )
  ];
}
