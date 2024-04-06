import 'package:cafe_management_system/core/model/item_model.dart';
import 'package:cafe_management_system/core/repo/cart_repo.dart';
import 'package:cafe_management_system/core/repo/category_repo.dart';
import 'package:cafe_management_system/core/utils/helpers/log_helper.dart';
import 'package:cafe_management_system/core/widgets/custom/app_snackbar.dart';
import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  Rxn<CafeItem> cafeItem = Rxn();
  @override
  void onInit() {
    // TODO: implement onInit
    var args = Get.arguments;
    if (args != null) {
      cafeItem.value = args['cafeItem'];
    }
    getProductDetail();
    super.onInit();
  }

  RxInt itemQuantity = RxInt(1);

  void getProductDetail() async {
    print(cafeItem.value!.id!);
    // print(
    //     '--------------------------------------------------api hit getproductdetail');
    if (cafeItem.value?.id != null) {
      Categoryrepo.getProductById(
          productId: cafeItem.value!.id!,
          onSuccess: (item) {
            cafeItem.value = item;
          },
          onError: (message) {
            LogHelper.error(message);
          });
    } else {
      SkySnackBar.error(
          title: "Error Occurred",
          message: "Something went wrong while fetching detail page");
    }
  }

  void addtoCart() async {
    CartRepo.addToCart(
        productId: cafeItem.value!.id!.toString(),
        quantity: itemQuantity.value.toString(),
        // tableId: selectedTable.value!.id.toString(),
        onSuccess: (message) {
          SkySnackBar.success(title: "Cart", message: message);
        },
        onError: (message) {
          SkySnackBar.error(title: "Error Occurred", message: message);
        });
    // openTableSelectBottomSheet();
  }

//------------------------------BOTTOMSHEET FLOW
  // Rxn<TableModelModel> selectedTable = Rxn();

  // openTableSelectBottomSheet() async {
  //   // selectedTable.value =
  //   showModalBottomSheet(
  //     isScrollControlled: true,
  //     context: Get.context!,
  //     builder: (context) {
  //       return Padding(
  //         padding: EdgeInsets.only(
  //           bottom: MediaQuery.of(context).viewInsets.bottom,
  //         ),
  //         child: SelectTableBottomSheet(
  //           onSelectTable: (tableModelModel) {
  //             // roomTypeController.text = roomType.title.toString();
  //             selectedTable.value = tableModelModel;
  //             // this.roomType.value = roomType;
  //             // if (crudState.value == CRUDSTATE.UPDATE) {
  //             //   updateIndex.value = roomType
  //             //       .id; //instaed of new variable id assing  the id to roomType
  //             //
  //           },
  //           cafeitem: cafeItem.value,
  //           itemquantity: itemQuantity.value,
  //         ),
  //       );
  //     },
  //   );
  // }

//------------------------------BOTTOMSHEET FLOW

  // void getEventDetail() async {
  //   print(event.value?.id);
  //   if (event.value?.id != null) {
  //     EventRepo.getEventDetails(
  //       eventId: event.value!.id!,
  //       onSuccess: (event) {
  //         this.event.value = event;

  //         print("-----------------------${event}");
  //       },
  //       onError: (message) {
  //         LogHelper.error(message);
  //       },
  //     );
  //   } else {
  //     GearSnackBar.error(
  //         title: "Error Occurred",
  //         message: "Something went wrong while fetching detail page");
  //   }
  // }
}
