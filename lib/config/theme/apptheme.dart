import 'package:ecommerce_c10_maadi/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme{
  static ThemeData lightTheme = ThemeData(
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 18.sp,
        color: ColorManager.headlineColor,
        fontWeight: FontWeight.w500
      )
    )
  );
}