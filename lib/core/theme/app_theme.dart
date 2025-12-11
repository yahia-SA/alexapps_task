import 'package:flutter/material.dart';
import 'package:alexapps_task/core/theme/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    primaryColor: AppColor.primaryColor,
    scaffoldBackgroundColor: AppColor.white,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.white,
      elevation: 0,
    ),
  );
}
