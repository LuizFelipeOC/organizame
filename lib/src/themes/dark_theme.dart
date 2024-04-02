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
        bottomSheetTheme: _bottomSheetThemeData(),
        progressIndicatorTheme: _progressIndicatorThemeData(),
        cardTheme: _cardTheme(),
      );

  CardTheme _cardTheme() {
    return CardTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: AppColors.grey.withOpacity(0.2),
    );
  }

  ProgressIndicatorThemeData _progressIndicatorThemeData() {
    return const ProgressIndicatorThemeData(
      color: AppColors.white,
    );
  }

  BottomSheetThemeData _bottomSheetThemeData() {
    return BottomSheetThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: AppColors.blackColor,
    );
  }

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
      bodySmall: TextStyle(
        color: AppColors.grey,
        fontSize: 14,
        fontWeight: FontWeight.normal,
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
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.red, width: 0.4),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.red, width: 0.5),
      ),
      errorStyle: const TextStyle(
        color: AppColors.red,
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
      errorMaxLines: 2,
      hintStyle: const TextStyle(
        color: AppColors.grey,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
