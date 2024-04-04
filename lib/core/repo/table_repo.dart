import 'dart:convert';

import 'package:cafe_management_system/core/model/table/table_booking_response_model.dart';
import 'package:cafe_management_system/core/model/table/table_model.dart';
import 'package:cafe_management_system/core/utils/constants/apis.dart';
import 'package:cafe_management_system/core/utils/constants/messages.dart';
import 'package:cafe_management_system/core/utils/helpers/log_helper.dart';
import 'package:cafe_management_system/core/utils/helpers/sky_requests.dart';
import 'package:http/http.dart' as http;

class TableRepo {
  static Future<void> getTables({
    required Function(List<TableModelModel> tables) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      String url = Api.tables;

      print(url);

      http.Response response = await SkyRequest.get(
        url,
      );
      print("---------------response$response}");
      var data = json.decode(response.body);
      print(data);
      if (data["status"]) {
        var tables = tableFromJson(data['data']);

        print("---cate${tables}");
        onSuccess(tables);
      } else {
        onError(data['message']);
      }
    } catch (e, s) {
      LogHelper.error(Api.tables, error: e, stackTrace: s);
      onError(Messages.error);
    }
  }

  static Future<void> bookTable({
    required int tableId,
    required String date,
    required String time,
    required int guestNumber,
    required Function(TableBookingResponseModel bookinTableResponse) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      String url = Api.tableReservation;

      print(url);

      var body = {
        "id": tableId,
        "date": date,
        "time": time,
        "guest_count": guestNumber,
      };

      http.Response response = await SkyRequest.post(
        url,
        body: body,
      );
      print("---------------response$response}");
      var data = json.decode(response.body);
      print(data);
      if (data["status"]) {
        var tableBookingResponse =
            TableBookingResponseModel.fromJson(data['data']);

        print("---cate${tableBookingResponse}");
        onSuccess(tableBookingResponse);
      } else {
        onError(data['message']);
      }
    } catch (e, s) {
      LogHelper.error(Api.tableReservation, error: e, stackTrace: s);
      onError(Messages.error);
    }
  }

  static Future<void> getAvailableTables({
    required Function(List<TableModelModel> availableTables) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      String url = Api.getAvailableReservationTables;

      http.Response response = await SkyRequest.get(
        url,
      );
      var data = json.decode(response.body);
      if (data["status"]) {
        var availableTables = tableFromJson(data['data']);

        onSuccess(availableTables);
      } else {
        onError(data['message']);
      }
    } catch (e, s) {
      LogHelper.error(Api.getAvailableReservationTables,
          error: e, stackTrace: s);
      onError(Messages.error);
    }
  }
}
