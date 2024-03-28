import 'package:cafe_management_system/core/utils/constants/colors.dart';
import 'package:cafe_management_system/core/widgets/common/button.dart';
import 'package:cafe_management_system/core/widgets/common/custom_text_style.dart';
import 'package:cafe_management_system/features/screens/product/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/common/network_imge.dart';

class ProductDetailScreen extends StatelessWidget {
  static const String routeName = "/product-detail";
  final c = Get.find<ProductDetailController>();
  ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            // top: 0,
            left: 0,
            right: 0,
            height: Get.height / 2,
            child: Container(
              child: ClipRRect(
                child: SkyNetworkImage(
                  imageUrl: "https://picsum.photos/200/300",
                  width: Get.width,
                  height: Get.height / 2,
                  boxFit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: Get.height / 2,
            child: Container(
              // height: Get.height,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Capuccino",
                    style: CustomTextStyles.f28W600(color: AppColors.primary),
                  ),
                  Text(
                    "descr",
                    textAlign: TextAlign.center,
                    style:
                        CustomTextStyles.f12W600(color: AppColors.blackColor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  PrimaryElevatedButton(onPressed: () {}, title: "Order Now,"),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Now Available",
                      textAlign: TextAlign.center,
                      style:
                          CustomTextStyles.f20W600(color: AppColors.blackColor),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
