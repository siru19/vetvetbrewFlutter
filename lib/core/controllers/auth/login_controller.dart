import 'package:cafe_management_system/core/controllers/core_controller.dart';
import 'package:cafe_management_system/core/repo/auth_repo.dart';
import 'package:cafe_management_system/core/widgets/custom/app_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../features/screens/dashscreen/dashboard_panel.dart';
import '../../widgets/custom/app_progress_dialog.dart';

class LoginController extends GetxController {
  final CoreController coreController = Get.find();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  ProgressDialog loading = ProgressDialog();
  RxBool showPass = RxBool(false);
  final FocusNode passNode = FocusNode();
  void onEyeClick() {
    showPass.value = !showPass.value;
  }

  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  Future<void> onSubmit() async {
    if (loginKey.currentState!.validate()) {
      loading.show();
      await AuthRepo.login(
          email: emailController.text,
          password: passwordController.text,
          onSuccess: (user) {
            coreController.loadCurrentUser();

            loading.hide();
            Get.offAllNamed(DashPageManager.routeName);
            SkySnackBar.success(
                title: "Login Success", message: "User logged in successfully");
          },
          onError: (message) {
            loading.hide();
            SkySnackBar.error(title: "Login Failed", message: message);
          });
    }
  }
}
