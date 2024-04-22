import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color redColor = Colors.red;
  static const Color yellowColor = Colors.yellow;
  static const Color green = Colors.green;
  static const Color whiteColor = Colors.white;
  static const Color scaffoldColor = Color.fromARGB(255, 236, 235, 235);

  static Color lightGrey = const Color.fromARGB(255, 207, 207, 207);

  //Shimmer Colors
  static final Color shimmerBase = Colors.grey.withOpacity(0.40);
  static const Color shimmerHighlight = Color(0xFFE1E1E1);
  static final Color shimmerBaseLight = Colors.grey.withOpacity(0.10);

  // ----------------
  static const Color blackColor = Colors.black;
  static const Color primary = Color.fromRGBO(59, 28, 10, 1);
}
