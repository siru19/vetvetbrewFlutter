import 'dart:convert';

import 'package:cafe_management_system/core/model/category_model.dart';
import 'package:cafe_management_system/core/model/item_model.dart';
import 'package:cafe_management_system/core/utils/constants/messages.dart';
import 'package:cafe_management_system/core/utils/helpers/log_helper.dart';
import 'package:cafe_management_system/core/utils/helpers/sky_requests.dart';
import 'package:http/http.dart' as http;

import '../utils/constants/apis.dart';

class Categoryrepo {
  static Future<void> getCategories({
    required Function(List<MenuCategory> categories) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      String url = Api.getCategories;

      print(url);

      http.Response response = await SkyRequest.get(
        url,
      );
      print("---------------response$response}");
      var data = json.decode(response.body);
      print(data);
      if (data["status"]) {
        var categories = categoriesFromJson(data['data']);

        print("---cate${categories}");
        onSuccess(categories);
      } else {
        onError(data['message']);
      }
    } catch (e, s) {
      LogHelper.error(Api.getCategories, error: e, stackTrace: s);
      onError(Messages.error);
    }
  }

  //get all products
  static Future<void> getProducts({
    required Function(List<CafeItem> items) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      String url = Api.getAllProducts;

      print(url);

      http.Response response = await SkyRequest.get(
        url,
      );
      print("---------------response$response}");
      var data = json.decode(response.body);
      print(data);
      if (data["status"]) {
        var products = itemsFromJson(data['data']);

        onSuccess(products);
      } else {
        onError(data['message']);
      }
    } catch (e, s) {
      LogHelper.error(Api.getAllProducts, error: e, stackTrace: s);
      onError(Messages.error);
    }
  }

  static Future<void> getItemsByCategoryId({
    required String categoryId,
    required Function(List<CafeItem> items) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      String url = (Api.productsByCategoryId.replaceAll("#id#", categoryId));

      http.Response response = await SkyRequest.get(
        url,
      );
      print("---------------response$response}");
      var data = json.decode(response.body);
      print(data);
      if (data["status"]) {
        var items = itemsFromJson(data['data']);

        print("---cate${items}");
        onSuccess(items);
      } else {
        onError(data['message']);
      }
    } catch (e, s) {
      LogHelper.error(Api.productsByCategoryId, error: e, stackTrace: s);
      onError(Messages.error);
    }
  }

  static Future<void> getProductById({
    required int productId,
    required Function(CafeItem item) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      String url = (Api.getProductById.replaceAll("#id#", productId.toString()));

      http.Response response = await SkyRequest.get(
        url,
      );
      print("---------------response$response}");
      var data = json.decode(response.body);
      print(data);
      if (data["status"]) {
        var item = CafeItem.fromJson(data['data']);

        print("---cate${item}");
        onSuccess(item);
      } else {
        onError(data['message']);
      }
    } catch (e, s) {
      LogHelper.error(Api.getProductById, error: e, stackTrace: s);
      onError(Messages.error);
    }
  }
}
