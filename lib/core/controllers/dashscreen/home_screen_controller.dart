// import 'package:chalchitra2/core/model/date_model.dart';
// import 'package:chalchitra2/core/model/movie_model.dart';
// import 'package:chalchitra2/core/repo/movie_repo.dart';
// import 'package:chalchitra2/core/utils/constants/enums.dart';
// import 'package:chalchitra2/core/utils/helpers/log_helper.dart';
// import 'package:get/get.dart';

import 'package:get/get.dart';

class HomeScreenController extends GetxController {
//   RxList<MovieModel> movies = RxList();
//   RxList<MovieDate> dates = RxList();

//   Rx<AppPageState> pageState = AppPageState.loading.obs;

//   @override
//   void onInit() {
//     getAllMovies();
//     getAllDates();
//     super.onInit();
//   }

//   RxInt tappedIndex = RxInt(0);

//   RxString movieDateStore = RxString("");

//   void getAllMovies({String? date}) async {
//     movies.clear();
//     MovieRepo.getAllMovies(
//       date: date,
//       onSuccess: (movie) {
//         if (movie.isEmpty) {
//           pageState.value = AppPageState.empty;
//         } else {
//           movies.addAll(movie);
//           pageState.value = AppPageState.normal;
//         }
//       },
//       onError: (message) {
//         pageState.value = AppPageState.error;
//         LogHelper.error(message);
//       },
//     );
//   }

//   void getAllDates() async {
//     // loading state
//     movies.clear();
//     MovieRepo.getAllDate(
//       onSuccess: (moviesDate) {
//         if (moviesDate.isEmpty) {
//           pageState.value = AppPageState.empty;
//         } else {
//           dates.addAll(moviesDate);
//           pageState.value = AppPageState.normal;
//         }
//       },
//       onError: (message) {
//         pageState.value = AppPageState.error;
//         LogHelper.error(message);
//       },
//     );
//   }
}
