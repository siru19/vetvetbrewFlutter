import 'package:cafe_management_system/core/controllers/dashscreen/cart/cart_controller.dart';
import 'package:cafe_management_system/core/utils/constants/colors.dart';
import 'package:cafe_management_system/core/utils/constants/icon_paths.dart';
import 'package:cafe_management_system/core/widgets/common/button.dart';
import 'package:cafe_management_system/core/widgets/common/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CheckoutBottomSheet extends StatelessWidget {
  final c = Get.find<CartController>();
  CheckoutBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
          Text(
            "Proceed Payment",
            style: CustomTextStyles.f16W600(color: AppColors.blackColor),
          ),
          const Divider(
            color: AppColors.blackColor,
            endIndent: 10,
            indent: 10,
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primary),
              borderRadius: BorderRadius.circular(10),
            ),
            // height: 70,
            // width: 70,
            child: SvgPicture.asset(
              IconPath.khalti,
              height: 70,
              width: 100,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          PrimaryElevatedButton(
              onPressed: () {
                // print("quntity----------${}");
                // print("--------cart id--${c.cafeItem.value?.id}");
                print("-------table_id---${c.selectedTable.value?.id}");

                print("-------refrenceId----khalti bata auxa");
              },
              title: "Submit"),
        ],
      ),
    );
  }
}
