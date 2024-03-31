import 'package:cafe_management_system/core/utils/constants/colors.dart';
import 'package:cafe_management_system/core/utils/constants/messages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SkySnackBar {
  static success({String? title, String? message}) {
    Get.snackbar(
      title ?? "Success",
      message ?? Messages.successMessage,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  static error({String? title, String? message}) {
    Get.snackbar(
      title ?? "Error!",
      message ?? Messages.error1,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      backgroundColor: AppColors.redColor,
      colorText: Colors.white,
    );
  }

  static info({String? title, required String message}) {
    Get.snackbar(
      title ?? "Info!",
      message,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      backgroundColor: AppColors.primary,
      colorText: Colors.white,
    );
  }
}
