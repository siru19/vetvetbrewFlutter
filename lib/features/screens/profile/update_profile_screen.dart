import 'package:cafe_management_system/core/utils/constants/colors.dart';
import 'package:cafe_management_system/core/utils/helpers/validators.dart';
import 'package:cafe_management_system/core/widgets/common/button.dart';
import 'package:cafe_management_system/core/widgets/common/custom_text_style.dart';
import 'package:cafe_management_system/core/widgets/common/text_form_field.dart';
import 'package:cafe_management_system/features/screens/profile/update_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class UpdateProfilScreen extends StatelessWidget {
  static const String routeName = "/update-profile-screen";
  final c = Get.find<UpdateProfileController>();
  UpdateProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Update Profile",
          style: CustomTextStyles.f16W600(),
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       print(c.myOrdersList);
        //     },
        //     icon: Icon(Icons.add),
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: c.updateProfileKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SvgPicture.asset(
                //   IconPath.cupLogo,
                //   height: 80,
                //   width: 80,
                // ),
                const SizedBox(
                  height: 50,
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
                  controller: c.nameController,
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
                  readOnly: true,
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
                  height: 37,
                ),
                PrimaryElevatedButton(
                  onPressed: c.onSubmit,
                  title: "Update",
                ),
                const SizedBox(
                  height: 6,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
