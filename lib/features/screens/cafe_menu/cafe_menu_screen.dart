import 'package:cafe_management_system/core/controllers/dashscreen/menu/menu_controller.dart';
import 'package:cafe_management_system/core/utils/constants/apis.dart';
import 'package:cafe_management_system/core/utils/constants/colors.dart';
import 'package:cafe_management_system/core/utils/constants/enums.dart';
import 'package:cafe_management_system/core/widgets/common/custom_text_style.dart';
import 'package:cafe_management_system/core/widgets/common/network_imge.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CafeMenuScreen extends StatelessWidget {
  static const String routeName = "/menu-screen";

  final c = Get.find<CafeMenuItemsController>();
  CafeMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Text(
              "Velvet Cafe Menu",
              style: CustomTextStyles.f28W600(color: AppColors.primary),
            ),
            Obx(() {
              if (c.pageState.value == PageState.LOADING) {
                return Center(
                  child: LinearProgressIndicator(),
                );
              } else if (c.pageState.value == PageState.EMPTY) {
                return Center(
                  child: Text("Empty"),
                );
              } else if (c.pageState.value == PageState.NORMAL) {
                return ListView.separated(
                  itemBuilder: (context, index) {
                    var category = c.cafeMenuSetList[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          category.name ?? "",
                          style: CustomTextStyles.f16W600(
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        if (category.products != null)
                          ListView.separated(
                            itemCount: category.products?.length ?? 0,
                            separatorBuilder: (context, index) {
                              if (category.products?.length != 0) {
                                return const SizedBox(
                                  height: 4,
                                );
                              } else {
                                return Text("menu fetching error");
                              }
                            },
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              if (category.products?.length != 0) {
                                var item = category.products?[index];

                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: SkyNetworkImage(
                                              height: 30,
                                              width: 30,
                                              // imageUrl: "",
                                              imageUrl:
                                                  "${Api.imageUrl}${item?.imageModel?.fileName}",
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(item?.name ?? "")
                                        ],
                                      ),
                                    ),
                                    const Expanded(
                                      flex: 2,
                                      child: Text(
                                          "------------------------------------------"),
                                    ),
                                    Text("Rs. ${item?.price ?? ""}"),
                                  ],
                                );
                              } else {
                                return Text("menu fetching error");
                              }
                            },
                          )
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 5,
                    );
                  },
                  itemCount: c.cafeMenuSetList.length,
                  shrinkWrap: true,
                );
              } else {
                return Center(
                  child: Text("Error View"),
                );
              }
            })
          ],
        ),
      ),
    ));
  }
}



// class MenuRowTile extends StatelessWidget {
//   const MenuRowTile({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Listvie
//   }
// }