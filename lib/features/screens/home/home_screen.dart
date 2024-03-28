import 'package:cafe_management_system/core/utils/constants/colors.dart';
import 'package:cafe_management_system/core/utils/constants/icon_paths.dart';
import 'package:cafe_management_system/core/widgets/common/custom_text_style.dart';
import 'package:cafe_management_system/core/widgets/common/text_form_field.dart';
import 'package:cafe_management_system/features/screens/product/presentation/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/controllers/dashscreen/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/home-screen";
  final c = Get.find<HomeScreenController>();
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "VelvetBrew",
          style: CustomTextStyles.f28W600(),
        ),
        actions: [
          InkResponse(
            child: SvgPicture.asset(IconPath.notifi),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Good Morning !",
                  style: CustomTextStyles.f20W600(),
                ),
                InkResponse(
                  child: SvgPicture.asset(IconPath.scan),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            PrimaryTextField(
              prefixIcon: Icon(
                Icons.search,
                color: AppColors.lightGrey,
              ),
              hint: "Search...",
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.name,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: Get.width,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.transparent,
                ),
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                "Buy 1 Get 1 Free",
                style: CustomTextStyles.f16W300(color: AppColors.whiteColor),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: Get.width,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(6),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 204, 203, 203),
                    blurRadius: 2.0,
                    spreadRadius: 1,
                    offset: Offset(
                      0,
                      3,
                    ),
                  )
                ],
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CoffeeCategory(
                    category: "All Beverages",
                  ),
                  CoffeeCategory(
                    category: "Hot Coffee",
                  ),
                  CoffeeCategory(
                    category: "Cold Coffee",
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: SizedBox(
                child: GridView.builder(
                  shrinkWrap: true,
                  // physics: AlwaysScrollableScrollPhysics(),
                  // physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // number of items in each row
                      mainAxisSpacing: 20, // spacing between rows
                      crossAxisSpacing: 20,
                      childAspectRatio: 0.9 // spacing between columns
                      ),
                  // padding: const EdgeInsets.all(
                  //     8.0), // padding around the grid
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        // Get.toNamed(Routes.map_screen);
                      },
                      child: Item(
                        icon: IconPath.apple,
                        title: "Cappacino",
                        price: "Rs. 499",
                        onTap: () {
                          // Get.toNamed(Routes.map_screen,
                          //     arguments: category.id);

                          Get.toNamed(ProductDetailScreen.routeName);
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CoffeeCategory extends StatelessWidget {
  final String? category;
  final Color? backgroundColor;
  final Color? textColor;
  const CoffeeCategory({
    super.key,
    required this.category,
    this.textColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.primary ?? backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        category ?? "",
        style: CustomTextStyles.f16W300(
            //TODO condition anusar check garne
            color: AppColors.whiteColor),
      ),
    );
  }
}

class Item extends StatelessWidget {
  final String? icon;
  final String? title;
  final VoidCallback? onTap;
  final String? price;

  Item({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(left: 6, right: 6, top: 4, bottom: 6),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          border: Border.all(color: AppColors.lightGrey),
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 204, 203, 203),
              blurRadius: 2.0,
              spreadRadius: 1,
              offset: Offset(
                0,
                3,
              ),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SvgPicture.network(
            //   // APIPathHelper.imageUrl + icon.toString(),
            //   // IconPath.apple,
            //   "$icon",
            //   height: 35,
            //   width: 35,
            //   alignment: Alignment.center,
            // ),
            Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  "$icon",
                  height: 80,
                  width: 80,
                  alignment: Alignment.center,
                ),
              ),
            ),

            Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Text(
                      title ?? "",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: 14,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      price ?? "",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: 14,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "Order Now",
                        style: CustomTextStyles.f14W300(
                            color: AppColors.whiteColor),
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
