

import 'package:cafe_management_system/core/model/user_model.dart';
import 'package:cafe_management_system/core/utils/helpers/log_helper.dart';
import 'package:cafe_management_system/core/utils/helpers/storage_helper.dart';
import 'package:get/get.dart';

class CoreController extends GetxController {
  Rxn<User> currentUser = Rxn();
//   Rxn<AccessToken> accessToken = Rxn();

//   @override
//   void onInit() {
//     loadCurrentUser();
//     super.onInit();
//   }

//   bool isUserLoggedIn() {
//     return currentUser.value != null;
//   }

  Future<void> loadCurrentUser() async {
    currentUser.value = StorageHelper.getUser();
    LogHelper.error("Current User",
        error: currentUser.value?.toJson().toString());
    // if (Get.isRegistered<ProfileController>()) {
    //   Get.find<ProfileController>().currentUser.value = currentUser.value;
    // }
  }

//   void updateUser() async {
//     // if (isUserLoggedIn()) {
//     // await AuthRepo.getProfile(onSuccess: (user) {
//     //   loadCurrentUser();
//     // }, onError: (message) {
//     //   Get.snackbar("Failed", message);
//     // });
//   }

// // bool isOnBoarded() => StorageHelper.isOnboarded();

// // bool isUserLoggedIn() => currentUser.value != null;

//   void logOut() async {
//     LogHelper.error("logout is hit");
//     final ProgressDialog loading = ProgressDialog();

//     loading.show(message: "Logging out...");
//     StorageHelper.clear();
//     loadCurrentUser();
//     loading.hide();

//     Get.offAllNamed(DashPageManager.routeName);
//   }

//   // Future<bool> checkCameraPermission() async {
//   //   bool hasAccess = false;

//   //   var status = await Permission.camera.status;

//   //   hasAccess = status != PermissionStatus.denied &&
//   //       status != PermissionStatus.permanentlyDenied;

//   //   if (hasAccess) {
//   //     return hasAccess;
//   //   }

//   //   var permission = await Permission.camera.request();

//   //   hasAccess = permission != PermissionStatus.denied &&
//   //       permission != PermissionStatus.permanentlyDenied;

//   //   return hasAccess;
//   // }
}
