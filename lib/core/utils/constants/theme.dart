import 'package:cafe_management_system/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTheme {
  static ThemeData basicTheme() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: AppColors.whiteColor,
      systemNavigationBarDividerColor: AppColors.primary,
    ));

    return ThemeData.light().copyWith(
      appBarTheme: const AppBarTheme(
        foregroundColor: AppColors.primary,
        backgroundColor: AppColors.scaffoldColor,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.scaffoldColor,
        selectedItemColor: AppColors.primary,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: TextStyle(color: AppColors.primary),
        unselectedLabelStyle: TextStyle(),
        type: BottomNavigationBarType.fixed,
      ),
      // popupMenuTheme:
      //     const PopupMenuThemeData(color: AppColors.backGroundColor),
      // // progressIndicatorTheme: const ProgressIndicatorThemeData(
      // //     color: AppColors.backGroundColor,
      // //     refreshBackgroundColor: AppColors.backGroundColor,
      // //     linearTrackColor: AppColors.primaryColor,
      // //     circularTrackColor: AppColors.primaryColor),
      // textTheme: getGearTextTheme(),
      // primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.scaffoldColor,
      // hintColor: AppColors.lightGreen,
      // colorScheme: ColorScheme.dark(
      //   primary: AppColors.primaryColor,
      //   secondary: AppColors.lightGreen,
      //   error: AppColors.error,
      //   onBackground: AppColors.backGroundColor,
      //   shadow: AppColors.shadowColor,
      //   outline: AppColors.lightGreen,
      // ),
    );
  }

  // static TextTheme getGearTextTheme() {
  //   return ThemeData.light().textTheme.copyWith().apply(
  //       fontFamily: "Poppins",
  //       bodyColor: AppColors.primaryColor,
  //       displayColor: AppColors.primaryColor,
  //       decorationColor: AppColors.lightGreen);
  // }
}
