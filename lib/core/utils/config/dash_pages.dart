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
import 'package:cafe_management_system/core/controllers/dashscreen/home/search_product_controller.dart';
import 'package:cafe_management_system/core/controllers/dashscreen/menu/menu_controller.dart';
import 'package:cafe_management_system/core/controllers/dashscreen/profile/profile_controller.dart';
import 'package:cafe_management_system/core/controllers/dashscreen/table/table_controller.dart';
import 'package:cafe_management_system/features/screens/cart/cart_screen.dart';
import 'package:cafe_management_system/features/screens/favourites/controller/favourite_controller.dart';
import 'package:cafe_management_system/features/screens/home/search_product_screen.dart';
import 'package:cafe_management_system/features/screens/mytables/my_reserved_table_controller.dart';
import 'package:cafe_management_system/features/screens/mytables/my_reserved_tablesList.dart';
import 'package:cafe_management_system/features/screens/product/controller/product_controller.dart';
import 'package:cafe_management_system/features/screens/product/presentation/product_detail_screen.dart';
import 'package:cafe_management_system/features/screens/profile/about_us_screen.dart';
import 'package:cafe_management_system/features/screens/profile/change_password_controller.dart';
import 'package:cafe_management_system/features/screens/profile/change_pw_screen.dart';
import 'package:cafe_management_system/features/screens/profile/update_profile_controller.dart';
import 'package:cafe_management_system/features/screens/profile/update_profile_screen.dart';
import 'package:cafe_management_system/features/screens/recent_orders/controller/my_orders_controller.dart';
import 'package:cafe_management_system/features/screens/recent_orders/presentation/my_orders_screen.dart';
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
    name: SearchProductScreen.routeName,
    page: () => SearchProductScreen(),
    binding: BindingsBuilder(
      () {
        Get.lazyPut(() => SearchProductController());
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
    name: MyOrdersScreen.routeName,
    page: () => MyOrdersScreen(),
    binding: BindingsBuilder(
      () {
        Get.lazyPut(() => MyOrderController());
      },
    ),
  ),

  GetPage(
    name: MyReservedTables.routeName,
    page: () => MyReservedTables(),
    binding: BindingsBuilder(
      () {
        Get.lazyPut(() => MyReservedTableController());
      },
    ),
  ),

   GetPage(
    name: UpdateProfilScreen.routeName,
    page: () => UpdateProfilScreen(),
    binding: BindingsBuilder(
      () {
        Get.lazyPut(() => UpdateProfileController());
      },
    ),
  ),
  GetPage(
    name: CustomerPasswordChange.routeName,
    page: () => CustomerPasswordChange(),
    binding: BindingsBuilder(
      () {
        Get.lazyPut(() => ChangePasswordController());
      },
    ),
  ),

  GetPage(
      name: AboutScreen.routeName,
      page: () => AboutScreen(),
      binding: BindingsBuilder(() {
        // Get.lazyPut(() => SplashController());
      })),
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
