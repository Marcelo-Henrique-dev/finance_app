import 'package:finance_app/common/constants/app_colors.dart';
import 'package:flutter/material.dart';

final defaultTheme = ThemeData(
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.greenOne),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.greenTwo),
    ),
    labelStyle: TextStyle(
      color: AppColors.greenTwo
    ),
  ),
);
