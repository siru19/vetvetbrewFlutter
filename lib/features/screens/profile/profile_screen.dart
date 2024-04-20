import 'package:cafe_management_system/core/utils/constants/colors.dart';
import 'package:cafe_management_system/core/utils/constants/icon_paths.dart';
import 'package:cafe_management_system/core/widgets/common/common_alert.dart';
import 'package:cafe_management_system/core/widgets/common/custom_text_style.dart';
import 'package:cafe_management_system/features/screens/mytables/my_reserved_tablesList.dart';
import 'package:cafe_management_system/features/screens/recent_orders/presentation/my_orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/controllers/dashscreen/profile/profile_controller.dart';
import '../../../core/widgets/common/network_imge.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = "/profile-page/";
  final c = Get.find<ProfileController>();
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: const BoxDecoration(
              color: AppColors.whiteColor,
              boxShadow: [
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //TODO logo
                Text(
                  "Profile",
                  style: CustomTextStyles.f16W600(),
                ),
                const Icon(
                  Icons.search,
                  color: AppColors.primary,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: const SkyNetworkImage(
                    imageUrl: "",
                    width: 60,
                    height: 60,
                    boxFit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      c.coreController.currentUser.value?.name ?? "",
                      style: CustomTextStyles.f20W600(),
                    ),
                    Text(
                      c.coreController.currentUser.value?.email ?? "",
                      style: CustomTextStyles.f16W700(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ProfileTiles(
                  onTap: () {},
                  iconUrl: IconPath.user,
                  title: "Profile Setting",
                ),
                const SizedBox(
                  height: 10,
                ),
                ProfileTiles(
                  onTap: () {
                    Get.toNamed(MyOrdersScreen.routeName);
                  },
                  iconUrl: IconPath.recentOrder,
                  title: "My Orders",
                ),
                const SizedBox(
                  height: 10,
                ),
                ProfileTiles(
                  onTap: () {},
                  iconUrl: IconPath.history,
                  title: "History",
                ),
                const SizedBox(
                  height: 10,
                ),
                ProfileTiles(
                  onTap: () {
                    Get.toNamed(MyReservedTables.routeName);
                  },
                  iconUrl: IconPath.scan,
                  title: "Un-Reserve Table",
                ),
                const SizedBox(
                  height: 10,
                ),
                // ProfileTiles(
                //   onTap: () {
                //     Get.toNamed(FavouritesScreen.routeName);
                //   },
                //   iconUrl: IconPath.fav,
                //   title: "Favourite",
                // ),
                Divider(
                  height: 10,
                  color: AppColors.lightGrey,
                  indent: 10,
                  endIndent: 10,
                ),
                ProfileTiles(
                  onTap: () {},
                  title: "About Us",
                  iconUrl: IconPath.aboutUs,
                ),
                const SizedBox(
                  height: 10,
                ),
                ProfileTiles(
                  title: "Change Password",
                  onTap: () {},
                  iconUrl: IconPath.lock,
                ),
                const SizedBox(
                  height: 10,
                ),
                ProfileTiles(
                  iconUrl: IconPath.logout,
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext ctx) {
                          return CustomAlertDialog(
                            // title: "Logout Confirmation",
                            message: "Are you sure to logout?",
                            onConfirm: () {
                              c.coreController.logOut();
                            },
                            confirmText: "Logout",
                          );
                        });
                  },
                  title: "Log out",
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

class ProfileTiles extends StatelessWidget {
  final String? iconUrl;
  final String title;
  final Function() onTap;

  const ProfileTiles({
    super.key,
    this.iconUrl,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      dense: true,
      leading: SvgPicture.asset(iconUrl ?? ""),
      title: Text(
        title,
        style: CustomTextStyles.f16W400(),
      ),
      trailing: SvgPicture.asset(IconPath.rightArrow),
    );
  }
}
