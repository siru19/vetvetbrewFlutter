import 'package:cafe_management_system/core/controllers/core_controller.dart';
import 'package:cafe_management_system/core/widgets/custom/app_progress_dialog.dart';
import 'package:cafe_management_system/core/widgets/custom/app_snackbar.dart';
import 'package:cafe_management_system/features/screens/auth/login_screen.dart';
import 'package:cafe_management_system/features/screens/auth/register/register_request_params.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../repo/auth_repo.dart';

class RegisterController extends GetxController {
  GlobalKey<FormState> registerKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController conPasswordController = TextEditingController();

  final CoreController coreController = Get.find();
  ProgressDialog loading = ProgressDialog();

  RxBool showPass = RxBool(false);
  RxBool showConPass = RxBool(false);
//   final FocusNode passNode = FocusNode();
//   final FocusNode conPassNode = FocusNode();
//   void onEyeClick() {
//     showPass.value = !showPass.value;
//   }

  Future<void> onSubmit() async {
    if (registerKey.currentState!.validate()) {
      loading.show();
      RegisterRequestParams regParams = RegisterRequestParams(
        name: usernameController.text,
        email: emailController.text,
        password: passwordController.text,
        passwordConfirmation: conPasswordController.text,
        phoneNo: phoneController.text,
      );
      await AuthRepo.register(
          registerRequestParams: regParams,
          onSuccess: (user) {
            loading.hide();
            coreController.loadCurrentUser();
            Get.offAllNamed(LoginScreen.routeName);
            SkySnackBar.success(
                title: "Register Success",
                message: "Account created successfully");
          },
          onError: (message) {
            loading.hide();
            SkySnackBar.error(title: "Register Failed", message: message);
          });
    }
  }
}
