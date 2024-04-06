import 'package:cafe_management_system/core/model/order/my_orders_response_model.dart';
import 'package:cafe_management_system/core/repo/order_repo.dart';
import 'package:cafe_management_system/core/utils/constants/enums.dart';
import 'package:cafe_management_system/core/utils/helpers/log_helper.dart';
import 'package:cafe_management_system/core/widgets/custom/app_progress_dialog.dart';
import 'package:get/get.dart';

class MyOrderController extends GetxController {
  RxList<MyOrdersResponseModel> myOrdersList = RxList();
  Rx<PageState> pageState = PageState.LOADING.obs;
  ProgressDialog loading = ProgressDialog();

  @override
  void onInit() {
    // TODO: implement onInit
    getAllOrders();
    super.onInit();
  }

  void getAllOrders() async {
    myOrdersList.clear();
    await OrderRepo.getMyOrders(
      onSuccess: (orders) {
        if (orders.isEmpty) {
          pageState.value = PageState.EMPTY;
        } else {
          // cartItems.addAll(cart[0].items!);
          // for (var i in cart) {
          //   cartItems.addAll(i.items!);
          // }
          myOrdersList.addAll(orders);
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
