import 'package:finance_app/common/constants/app_colors.dart';
import 'package:flutter/material.dart';

final defaultTheme = ThemeData(
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.greenLightOne),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.greenLigthTwo),
    ),
    labelStyle: TextStyle(
      color: AppColors.greenLigthTwo
    ),
  ),
);
