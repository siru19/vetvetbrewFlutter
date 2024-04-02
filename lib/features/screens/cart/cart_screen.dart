import 'package:cafe_management_system/core/model/cart/cart_model.dart';
import 'package:cafe_management_system/core/utils/constants/colors.dart';
import 'package:cafe_management_system/core/utils/constants/enums.dart';
import 'package:cafe_management_system/core/widgets/common/button.dart';
import 'package:cafe_management_system/core/widgets/common/common_alert.dart';
import 'package:cafe_management_system/core/widgets/common/network_imge.dart';
import 'package:cafe_management_system/core/widgets/shimmer/product_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/controllers/dashscreen/cart/cart_controller.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = "/cart-screen";
  final c = Get.find<CartController>();
  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: const Text("Cart"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Obx(() {
                if (c.pageState.value == PageState.LOADING) {
                  return CategoryShimmer.gearList();
                } else if (c.pageState.value == PageState.EMPTY) {
                  return const Center(
                    child: Text("Empty"),
                  );
                } else if (c.pageState.value == PageState.NORMAL) {
                  return ListView.separated(
                    padding: const EdgeInsets.only(bottom: 50),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: c.cartList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var cartItem = c.cartList[index];
                      if (cartItem.items!.isNotEmpty) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListView.separated(
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  height: 10,
                                );
                              },
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: cartItem.items!.length,
                              itemBuilder: (context, itemIndex) {
                                var item = cartItem.items![itemIndex];
                                return CartRow(
                                  item: item,
                                  onEdit: () {
                                    // c.cartItem.value = item;
                                    // c.updateCartItem(item.id!);
                                    c.showBottomSheet(item);
                                  },
                                  onConfirmDelete: () {
                                    c.deleteCartItem(item.id!);

                                    // print(item.id);
                                  },
                                );
                              },
                            ),
                          ],
                        );
                      } else {
                        return const SizedBox(
                          height: 10,
                        );
                      }
                    },
                    separatorBuilder: (context, index) =>
                        Divider(), // Add your separator builder
                  );
                } else {
                  return const Center(
                    child: Text("Error View"),
                  );
                }
              })
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: PrimaryElevatedButton(
          onPressed: () {
            // Get.toNamed(CheckoutScreen.routeName,
            //     arguments: {"cart": c.cart.value});
          },
          title: "Checkout",
          height: 40,
        ),
      ),
    );
  }
}

class CartRow extends StatelessWidget {
  final Items item;
  final Function() onEdit;

  final Function() onConfirmDelete;

  const CartRow({
    super.key,
    required this.item,
    required this.onConfirmDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SkyNetworkImage(
                // imageUrl: "${Api.imageUrl}${cafeItem.imageModel?.fileName}",
                imageUrl: "",
                height: 60,
                // width: 80,
                boxFit: BoxFit.cover,
                // alignment: Alignment.center,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // RichText(
                  //   text: TextSpan(
                  //       text: 'Item id:',
                  //       style: TextStyle(color: Colors.grey, fontSize: 14),
                  //       children: <TextSpan>[
                  //         TextSpan(
                  //           text: item.id != null ? item.id.toString() : "",
                  //           style: const TextStyle(
                  //               color: Colors.black,
                  //               fontSize: 14,
                  //               overflow: TextOverflow.ellipsis),
                  //         )
                  //       ]),
                  // ),
                  RichText(
                    text: TextSpan(
                        text: 'Name:',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                        children: <TextSpan>[
                          TextSpan(
                            text: item.cafeItem != null
                                ? item.cafeItem?.name.toString()
                                : "",
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                overflow: TextOverflow.ellipsis),
                          )
                        ]),
                  ),
                  const SizedBox(height: 4),
                  RichText(
                    text: TextSpan(
                        text: 'Quantity: ',
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 14),
                        children: <TextSpan>[
                          TextSpan(
                            text: item.quantity != null
                                ? item.quantity.toString()
                                : "",
                            style: const TextStyle(
                                color: Colors.black, fontSize: 14),
                          )
                        ]),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkResponse(
                        onTap: onEdit,
                        borderRadius: BorderRadius.circular(10),
                        radius: 10,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.edit,
                            color: AppColors.green,
                          ),
                        ),
                      ),
                      InkResponse(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext ctx) {
                                return CustomAlertDialog(
                                    title: "Do you really want to delete ?",
                                    message: "You cannot undo this action",
                                    onConfirm: onConfirmDelete,
                                    confirmText: "Yes");
                              });
                        },
                        borderRadius: BorderRadius.circular(10),
                        radius: 10,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.cancel,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}