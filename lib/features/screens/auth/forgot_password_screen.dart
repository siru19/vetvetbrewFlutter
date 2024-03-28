import 'package:cafe_management_system/core/utils/constants/colors.dart';
import 'package:cafe_management_system/core/utils/constants/icon_paths.dart';
import 'package:cafe_management_system/core/widgets/common/button.dart';
import 'package:cafe_management_system/core/widgets/common/custom_text_style.dart';
import 'package:cafe_management_system/features/screens/auth/otp_verify_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/controllers/auth/forgot_controller.dart';
import '../../../core/utils/helpers/validators.dart';
import '../../../core/widgets/common/text_form_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const String routeName = "/forgot-pw-screen";
  final c = Get.find<ForgotPasswordController>();
  ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          "Reset Password",
          style: CustomTextStyles.f15W600(),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: c.sendMailKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    IconPath.lockvector,
                    height: 80,
                    width: 80,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "To Reset your password, Please enter your email address",
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.f16W400(color: AppColors.primary),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Email",
                  style: CustomTextStyles.f16W400(color: AppColors.primary),
                ),
                const SizedBox(
                  height: 4,
                ),
                PrimaryTextField(
                  hint: "Enter your email",
                  controller: c.emailController,
                  validator: (value) => Validator.validateEmail(value!),
                  autofocus: true,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 37,
                ),
                PrimaryElevatedButton(
                  onPressed: () {
                    Get.toNamed(OTPVerifyScreen.routeName);
                  },
                  title: "Next",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
