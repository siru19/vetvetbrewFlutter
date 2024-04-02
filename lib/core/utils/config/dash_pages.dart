// import 'package:chalchitra2/core/controllers/dashscreen/dash_page_manager_controller.dart';
// import 'package:chalchitra2/core/controllers/dashscreen/home_screen_controller.dart';
// import 'package:chalchitra2/core/controllers/movie/movie_detail_controller.dart';
// import 'package:chalchitra2/core/controllers/movie/seat_book_controller.dart';
// import 'package:chalchitra2/core/controllers/profile/profile_controller.dart';
// import 'package:chalchitra2/features/screens/dashscreen/dash_screen_manager.dart';
// import 'package:chalchitra2/features/screens/movie/movie_details_screen.dart';
// import 'package:chalchitra2/features/screens/movie/seat_book_screen.dart';
// import 'package:get/get.dart';

import 'package:cafe_management_system/core/controllers/dashscreen/cart/cart_controller.dart';
import 'package:cafe_management_system/core/controllers/dashscreen/dash_page_manager_controller.dart';
import 'package:cafe_management_system/core/controllers/dashscreen/menu/menu_controller.dart';
import 'package:cafe_management_system/core/controllers/dashscreen/profile/profile_controller.dart';
import 'package:cafe_management_system/core/controllers/dashscreen/table/table_controller.dart';
import 'package:cafe_management_system/features/screens/cart/cart_screen.dart';
import 'package:cafe_management_system/features/screens/favourites/controller/favourite_controller.dart';
import 'package:cafe_management_system/features/screens/product/controller/product_controller.dart';
import 'package:cafe_management_system/features/screens/product/presentation/product_detail_screen.dart';
import 'package:cafe_management_system/features/screens/recent_orders/controller/recent_order_controller.dart';
import 'package:cafe_management_system/features/screens/recent_orders/presentation/recent_order_screen.dart';
import 'package:get/get.dart';

import '../../../features/screens/dashscreen/dashboard_panel.dart';
import '../../../features/screens/favourites/presentation/favourites_screen.dart';
import '../../controllers/dashscreen/home/home_screen_controller.dart';

final List<GetPage> dashScreenPages = <GetPage>[
  GetPage(
    name: DashPageManager.routeName,
    page: () => DashPageManager(),
    binding: BindingsBuilder(
      () {
        Get.lazyPut(() => DashboardPanelController());
        Get.lazyPut(() => HomeScreenController());
        Get.lazyPut(() => CafeMenuItemsController());
        Get.lazyPut(() => TableController());
        Get.lazyPut(() => ProfileController());
        Get.lazyPut(() => CartController());

        // Get.lazyPut(() => ProfileController());
        // Get.lazyPut(() => ProfileController());
        // Get.lazyPut(() => SettingsController());
        // Get.lazyPut(() => GearListCreationController());
      },
    ),
  ),

  GetPage(
    name: ProductDetailScreen.routeName,
    page: () => ProductDetailScreen(),
    binding: BindingsBuilder(
      () {
        Get.lazyPut(() => ProductDetailController());
      },
    ),
  ),

  GetPage(
    name: FavouritesScreen.routeName,
    page: () => FavouritesScreen(),
    binding: BindingsBuilder(
      () {
        Get.lazyPut(() => FavouriteController());
      },
    ),
  ),

  GetPage(
    name: CartScreen.routeName,
    page: () => CartScreen(),
    binding: BindingsBuilder(
      () {
        Get.lazyPut(() => CartController());
      },
    ),
  ),

  GetPage(
    name: RecentOrdersScreen.routeName,
    page: () => RecentOrdersScreen(),
    binding: BindingsBuilder(
      () {
        Get.lazyPut(() => RecentOrderController());
      },
    ),
  ),
//   // GetPage(
//   //   name: GearListsPage.routeName,
//   //   page: () => GearListsPage(),
//   //   binding: BindingsBuilder(
//   //     () {
//   //       Get.lazyPut(() => GearListController());
//   //     },
//   //   ),
//   // ),
//   // GetPage(
//   //   name: ProfilePage.routeName,
//   //   page: () => ProfilePage(),
//   //   binding: BindingsBuilder(
//   //     () {
//   //       Get.lazyPut(() => ProfileController());
//   //     },
//   //   ),
//   // ),
//   // GetPage(
//   //   name: ActivityPage.routeName,
//   //   page: () => ActivityPage(),
//   //   binding: BindingsBuilder(
//   //     () {
//   //       Get.lazyPut(() => ActivityController());
//   //     },
//   //   ),
//   // ),
//   // GetPage(
//   //   name: ChangePasswordPage.routeName,
//   //   page: () => ChangePasswordPage(),
//   //   binding: BindingsBuilder(
//   //     () {
//   //       Get.lazyPut(() => ChangePasswordController());
//   //     },
//   //   ),
//   // ),
//   // GetPage(
//   //   name: AdventureDetailPage.routeName,
//   //   page: () => AdventureDetailPage(),
//   //   binding: BindingsBuilder(
//   //     () {
//   //       Get.lazyPut(() => AdventureDetailController());
//   //     },
//   //   ),
//   // ),
];
