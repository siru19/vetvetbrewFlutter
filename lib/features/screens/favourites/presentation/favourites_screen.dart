import 'package:cafe_management_system/core/widgets/common/custom_text_style.dart';
import 'package:cafe_management_system/features/screens/favourites/controller/favourite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouritesScreen extends StatelessWidget {
  static const String routeName = "/fav-screen";
  final c = Get.find<FavouriteController>();
  FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Favourites",
          style: CustomTextStyles.f16W600(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(
                child: GridView.builder(
                  shrinkWrap: true,
                  // physics: AlwaysScrollableScrollPhysics(),
                  physics: const NeverScrollableScrollPhysics(),
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
                    // return InkWell(
                    //   onTap: () {
                    //     // Get.toNamed(Routes.map_screen);
                    //   },
                    //   child: ItemCard(

                    //   ),
                    // );
                    return Container(
                      child: Text("demo"),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
