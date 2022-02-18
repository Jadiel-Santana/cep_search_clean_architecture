import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

  ThemeData appTheme() {
    const Color primaryColor = AppColors.primary;
    const Color white = AppColors.white;

    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryColor: primaryColor,
      backgroundColor: white,
      scaffoldBackgroundColor: white,
      hintColor: primaryColor,
      brightness: Brightness.light,
      fontFamily: 'Montserrat',
      appBarTheme: const AppBarTheme(
        elevation: 0,
        titleSpacing: 0,
        centerTitle: true,
        color: primaryColor, systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      cardTheme: CardTheme(
        color: white,
        elevation: 4,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor),
        ),
        labelStyle: TextStyle(color: primaryColor),
        prefixIconColor: primaryColor,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: 0,
        foregroundColor: white,
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }