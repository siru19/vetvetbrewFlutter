// import 'dart:async';

// import 'package:chalchitra2/core/controllers/core_controller.dart';
// import 'package:chalchitra2/features/screens/dashscreen/dash_screen_manager.dart';
// import 'package:get/get.dart';

import 'dart:async';

import 'package:cafe_management_system/core/controllers/core_controller.dart';
import 'package:cafe_management_system/features/screens/auth/login_screen.dart';
import 'package:cafe_management_system/features/screens/dashscreen/dashboard_panel.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final CoreController coreController = Get.find();

  @override
  void onInit() async {
    Timer(
      const Duration(seconds: 3),
      () {
        if (coreController.isUserLoggedIn()) {
          Get.offAllNamed(DashPageManager.routeName);
        } else {
          Get.offAllNamed(LoginScreen.routeName);
        }
        // Get.offAllNamed(LoginScreen.routeName);
      },
    );

    super.onInit();
  }
}
