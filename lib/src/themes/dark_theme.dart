import 'package:flutter/material.dart';

import '../app_colors.dart';

class DarkTheme {
  ThemeData get themeData => ThemeData(
        useMaterial3: false,
        fontFamily: 'Inter',
        scaffoldBackgroundColor: AppColors.blackColor,
        textTheme: _textTheme(),
        inputDecorationTheme: _inputDecoration(),
        iconTheme: _iconThemeData(),
      );

  IconThemeData _iconThemeData() {
    return const IconThemeData(
      color: AppColors.white,
      size: 22,
    );
  }

  TextTheme _textTheme() {
    return const TextTheme(
      headlineLarge: TextStyle(
        color: AppColors.white,
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        color: AppColors.grey,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      labelLarge: TextStyle(
        color: AppColors.white,
        fontSize: 16,
        fontWeight: FontWeight.w800,
      ),
      labelMedium: TextStyle(
        color: AppColors.white,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  InputDecorationTheme _inputDecoration() {
    return InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.purpleSecondary),
      ),
      hintStyle: const TextStyle(
        color: AppColors.grey,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
