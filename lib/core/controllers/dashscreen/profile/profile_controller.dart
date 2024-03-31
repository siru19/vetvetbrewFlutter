import 'package:cafe_management_system/core/controllers/core_controller.dart';
import 'package:cafe_management_system/core/repo/auth_repo.dart';
import 'package:cafe_management_system/core/utils/constants/colors.dart';
import 'package:cafe_management_system/core/widgets/custom/app_progress_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final coreController = Get.find<CoreController>();

  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  final ProgressDialog loading = ProgressDialog();
  final resetPwKey = GlobalKey<FormState>();

  final FocusNode passNode = FocusNode();
  final FocusNode conPassNode = FocusNode();

  RxBool showPass = RxBool(false);
  RxBool showConPass = RxBool(false);

  void onEyeClick() {
    showPass.value = !showPass.value;
  }

  void onConEyeClick() {
    showConPass.value = !showConPass.value;
  }

  void openBottomSheetChangePW() async {
    // showModalBottomSheet(
    //   backgroundColor: AppColors.whiteColor,
    //   context: Get.context!,
    //   builder: (context) {
    //     return ChangePassword();
    //   },
    // );
  }

  Future<void> onSubmit() async {
    // if (resetPwKey.currentState!.validate()) {
    //   loading.show();
    //   await AuthRepo.changePassword(
    //       oldPassword: passwordController.text,
    //       newPassword: passwordConfirmController.text,
    //       onSuccess: (user) {
    //         coreController.loadCurrentUser();

    //         loading.hide();
    //         Get.back();
    //         GearSnackBar.success(
    //             title: "Password Change",
    //             message: "Your password has been successfully changed.");
    //       },
    //       onError: (message) {
    //         loading.hide();
    //         GearSnackBar.error(title: "Password Change", message: message);
    //       });
    // }
  }
}
