import 'package:cafe_management_system/core/utils/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'core/controllers/core_controller.dart';
import 'core/utils/config/pages.dart';
import 'features/screens/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  Get.put(CoreController());
  runApp(Cafe()
      // DevicePreview(
      // enabled: !kReleaseMode,
      // builder: (context) => MyApp(), // Wrap your app
      // ),

      );
}

class Cafe extends StatelessWidget {
  // final coreController = Get.find<CoreController>();

  Cafe({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: CustomTheme.basicTheme(),
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      getPages: getPages,
    );
  }
}
