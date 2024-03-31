// import 'package:chalchitra2/core/model/date_model.dart';
// import 'package:chalchitra2/core/model/movie_model.dart';
// import 'package:chalchitra2/core/repo/movie_repo.dart';
// import 'package:chalchitra2/core/utils/constants/enums.dart';
// import 'package:chalchitra2/core/utils/helpers/log_helper.dart';
// import 'package:get/get.dart';

import 'package:cafe_management_system/core/model/category_model.dart';
import 'package:cafe_management_system/core/model/item_model.dart';
import 'package:cafe_management_system/core/repo/category_repo.dart';
import 'package:get/get.dart';

import '../../../utils/constants/enums.dart';
import '../../../utils/helpers/log_helper.dart';

class HomeScreenController extends GetxController {
  RxList<MenuCategory> categoryList = RxList();

  RxList<CafeItem> itemList = RxList();

  // RxBool isCategoryEnabled = RxBool(false);
  RxInt selectedIndex = (-1).obs;

  Rx<PageState> pageState = PageState.LOADING.obs;

  @override
  void onInit() {
    getAllCategories();
    getAllProducts();
    super.onInit();
  }

  void getAllCategories() async {
    categoryList.clear();
    await Categoryrepo.getCategories(
      onSuccess: (categories) {
        if (categories.isEmpty) {
          pageState.value = PageState.EMPTY;
        } else {
          categoryList.addAll(categories);
          pageState.value = PageState.NORMAL;
        }
      },
      onError: (message) {
        pageState.value = PageState.ERROR;
        LogHelper.error(message);
      },
    );
  }

  void getAllProducts() async {
    itemList.clear();
    await Categoryrepo.getProducts(
      onSuccess: (products) {
        if (products.isEmpty) {
          pageState.value = PageState.EMPTY;
        } else {
          itemList.addAll(products);
          pageState.value = PageState.NORMAL;
        }
      },
      onError: (message) {
        pageState.value = PageState.ERROR;
        LogHelper.error(message);
      },
    );
  }

  void getProductsByCategoryId(int categoryId) async {
    itemList.clear();
    await Categoryrepo.getItemsByCategoryId(
      categoryId: categoryId.toString(),
      onSuccess: (products) {
        if (products.isEmpty) {
          pageState.value = PageState.EMPTY;
        } else {
          itemList.addAll(products);
          pageState.value = PageState.NORMAL;
        }
      },
      onError: (message) {
        pageState.value = PageState.ERROR;
        LogHelper.error(message);
      },
    );
  }
}
