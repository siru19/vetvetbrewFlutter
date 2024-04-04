import 'package:cafe_management_system/core/repo/auth_repo.dart';
import 'package:cafe_management_system/core/widgets/custom/app_progress_dialog.dart';
import 'package:cafe_management_system/core/widgets/custom/app_snackbar.dart';
import 'package:cafe_management_system/features/screens/auth/otp_verify_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  GlobalKey<FormState> sendMailKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  ProgressDialog loading = ProgressDialog();

  Future<void> onSubmit() async {
    if (sendMailKey.currentState!.validate()) {
      loading.show();
      await AuthRepo.forgotPassword(
          email: emailController.text,
          onSuccess: (token) {
            loading.hide();
            Get.offAllNamed(OTPVerifyScreen.routeName, arguments: {
              "token": token,
            });
            SkySnackBar.success(title: "OTP", message: "Verify your OTP");
          },
          onError: (message) {
            loading.hide();
            SkySnackBar.error(title: "Forgot password", message: message);
          });
    }
  }
}
