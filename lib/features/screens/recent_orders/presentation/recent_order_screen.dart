import 'package:cafe_management_system/core/utils/constants/colors.dart';
import 'package:cafe_management_system/core/widgets/common/custom_text_style.dart';
import 'package:cafe_management_system/core/widgets/common/network_imge.dart';
import 'package:flutter/material.dart';

class RecentOrdersScreen extends StatelessWidget {
  static const String routeName = "/recent-order";
  const RecentOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Recent Orders",
          style: CustomTextStyles.f16W600(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              RecentOrderRowWidget(
                itemName: "Hazelnut Latte",
                price: "Rs. 450",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecentOrderRowWidget extends StatelessWidget {
  final String? imageUrl;
  final String? itemName;
  final String? price;
  const RecentOrderRowWidget({
    super.key,
    this.imageUrl,
    required this.itemName,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: const SkyNetworkImage(
                  imageUrl: "https://picsum.photos/200/300",
                  width: 60,
                  height: 60,
                  boxFit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    itemName ?? "",
                    style:
                        CustomTextStyles.f16W500(color: AppColors.blackColor),
                  ),
                  Text(
                    price ?? "",
                    style:
                        CustomTextStyles.f14W400(color: AppColors.blackColor),
                  ),
                ],
              ),
            ],
          ),
          Icon(
            Icons.more_vert,
            color: AppColors.blackColor,
          )
        ],
      ),
    );
  }
}
