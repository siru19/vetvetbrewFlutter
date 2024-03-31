import 'dart:convert';

import 'package:cafe_management_system/core/model/cafe_product_menu_model.dart';
import 'package:cafe_management_system/core/utils/constants/apis.dart';
import 'package:cafe_management_system/core/utils/constants/messages.dart';
import 'package:cafe_management_system/core/utils/helpers/log_helper.dart';
import 'package:cafe_management_system/core/utils/helpers/sky_requests.dart';
import 'package:http/http.dart' as http;

class MenuRepo {
  static Future<void> getCafeMenuSet({
    required Function(List<CafeMenuSet> cafeMenus) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      String url = Api.menu;

      print(url);

      http.Response response = await SkyRequest.get(
        url,
      );
      print("---------------response$response}");
      var data = json.decode(response.body);
      print(data);
      if (data["status"]) {
        var menus = cafeMenuItemsFromJson(data['data']);

        onSuccess(menus);
      } else {
        onError(data['message']);
      }
    } catch (e, s) {
      LogHelper.error(Api.menu, error: e, stackTrace: s);
      onError(Messages.error);
    }
  }
}
