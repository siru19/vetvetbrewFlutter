import 'package:cafe_management_system/core/utils/constants/colors.dart';
import 'package:cafe_management_system/core/utils/constants/image_path.dart';
import 'package:cafe_management_system/core/utils/helpers/validators.dart';
import 'package:cafe_management_system/core/widgets/common/button.dart';
import 'package:cafe_management_system/core/widgets/common/custom_text_style.dart';
import 'package:cafe_management_system/features/screens/auth/forgot_password_screen.dart';
import 'package:cafe_management_system/features/screens/auth/register/presentation/register_screen.dart';
import 'package:cafe_management_system/features/screens/dashscreen/dashboard_panel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/controllers/auth/login_controller.dart';
import '../../../core/widgets/common/text_form_field.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "/login-screen";
  final c = Get.find<LoginController>();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Form(
              key: c.loginKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  // SvgPicture.asset(
                  //   IconPath.cupLogo,
                  //   height: 80,
                  //   width: 80,
                  // ),
                  Center(
                    child: Image.asset(ImagePath.cafeLogo,
                        height: 200, width: 200),
                  ),

                  Text(
                    "Welcome Back",
                    style: CustomTextStyles.f16W600(color: AppColors.primary),
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
                    hint: "Email",
                    controller: c.emailController,
                    validator: (value) => Validator.validateEmail(value!),
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Password",
                    style: CustomTextStyles.f16W400(color: AppColors.primary),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  PrimaryTextField(
                    hint: "Password",
                    validator: (value) => Validator.validatePassword(value!),
                    controller: c.passwordController,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        Get.toNamed(ForgotPasswordScreen.routeName);
                      },
                      radius: 10,
                      child: Text(
                        "Forgot Password?",
                        style:
                            CustomTextStyles.f16W600(color: AppColors.primary),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 37,
                  ),
                  PrimaryElevatedButton(
                    // onPressed: c.onSubmit,
                    onPressed: () {
                      Get.toNamed(DashPageManager.routeName);
                    },
                    title: "Log in",
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style:
                            CustomTextStyles.f15W600(color: AppColors.primary),
                      ),
                      TextButton(
                          onPressed: () {
                            Get.toNamed(RegisterScreen.routeName);
                          },
                          child: Text(
                            "Sign Up",
                            style: CustomTextStyles.f15W600(
                                color: AppColors.primary),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
