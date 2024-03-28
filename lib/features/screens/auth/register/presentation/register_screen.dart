import 'package:cafe_management_system/core/utils/constants/colors.dart';
import 'package:cafe_management_system/core/utils/constants/icon_paths.dart';
import 'package:cafe_management_system/core/widgets/common/button.dart';
import 'package:cafe_management_system/core/widgets/common/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../core/controllers/auth/register_controller.dart';
import '../../../../../core/utils/helpers/validators.dart';
import '../../../../../core/widgets/common/text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = "/register-screen";
  final c = Get.find<RegisterController>();
  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: c.registerKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SvgPicture.asset(
                //   IconPath.cupLogo,
                //   height: 80,
                //   width: 80,
                // ),
                const SizedBox(
                  height: 16,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Create New Account",
                    style: CustomTextStyles.f16W600(color: AppColors.primary),
                  ),
                ),
                Text(
                  "Username",
                  style: CustomTextStyles.f16W400(color: AppColors.primary),
                ),
                const SizedBox(
                  height: 4,
                ),
                PrimaryTextField(
                  hint: "Username",
                  controller: c.usernameController,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.name,
                  validator: (value) => Validator.validateEmpty(value!),
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
                  textInputAction: TextInputAction.next,
                  validator: (value) => Validator.validateEmail(value!),
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Phone Number",
                  style: CustomTextStyles.f16W400(color: AppColors.primary),
                ),
                const SizedBox(
                  height: 4,
                ),
                PrimaryTextField(
                  hint: "9800000000",
                  controller: c.phoneController,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.emailAddress,
                  validator: (value) => Validator.validateMobile(value!),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
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
                  height: 16,
                ),
                Text(
                  "Confirm Password",
                  style: CustomTextStyles.f16W400(color: AppColors.primary),
                ),
                const SizedBox(
                  height: 4,
                ),
                PrimaryTextField(
                  hint: "Confirm Password",
                  validator: (value) => Validator.validatePassword(value!),
                  controller: c.conPasswordController,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 37,
                ),
                PrimaryElevatedButton(
                  onPressed: c.onSubmit,
                  title: "Sign up",
                ),
                const SizedBox(
                  height: 6,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Or",
                    style: CustomTextStyles.f16W400(),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                PrimaryOutlineButton(
                  onPressed: () {},
                  title: "Continue with Google",
                  suffixIconPath: IconPath.google,
                ),
                const SizedBox(
                  height: 6,
                ),
                PrimaryOutlineButton(
                  onPressed: () {},
                  title: "Continue with Apple",
                  suffixIconPath: IconPath.apple,
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account ?",
                      style: CustomTextStyles.f15W600(color: AppColors.primary),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Login",
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
    );
  }
}
