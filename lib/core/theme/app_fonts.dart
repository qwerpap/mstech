import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppFonts {
  // Основные шрифты приложения
  static const String primary = 'Roboto';
  static const String secondary = 'Inter';

  // Размеры шрифтов (читаемые имена)
  static const double size10 = 10.0;
  static const double size12 = 12.0;
  static const double size14 = 14.0;
  static const double size16 = 16.0;
  static const double size18 = 18.0;
  static const double size20 = 20.0;
  static const double size24 = 24.0;
  static const double size32 = 32.0;

  // Веса шрифтов
  static const FontWeight light = FontWeight.w300;
  static const FontWeight normal = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semibold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;

  // Готовые стили текста
  static const TextStyle displayLarge = TextStyle(
    fontFamily: primary,
    fontSize: size32,
    fontWeight: bold,
    color: AppColors.blackColor,
  );

  static const TextStyle displayMedium = TextStyle(
    fontFamily: primary,
    fontSize: size24,
    fontWeight: bold,
    color: AppColors.blackColor,
  );

  static const TextStyle displaySmall = TextStyle(
    fontFamily: primary,
    fontSize: size20,
    fontWeight: bold,
    color: AppColors.blackColor,
  );

  static const TextStyle headlineLarge = TextStyle(
    fontFamily: primary,
    fontSize: size18,
    fontWeight: semibold,
    color: AppColors.blackColor,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontFamily: primary,
    fontSize: size16,
    fontWeight: semibold,
    color: AppColors.blackColor,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontFamily: primary,
    fontSize: size14,
    fontWeight: semibold,
    color: AppColors.blackColor,
  );

  static const TextStyle titleLarge = TextStyle(
    fontFamily: primary,
    fontSize: size16,
    fontWeight: semibold,
    color: AppColors.blackColor,
  );

  static const TextStyle titleMedium = TextStyle(
    fontFamily: primary,
    fontSize: size14,
    fontWeight: medium,
    color: AppColors.blackColor,
  );

  static const TextStyle titleSmall = TextStyle(
    fontFamily: primary,
    fontSize: size12,
    fontWeight: medium,
    color: AppColors.blackColor,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontFamily: secondary,
    fontSize: size16,
    fontWeight: normal,
    color: AppColors.blackColor,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: secondary,
    fontSize: size14,
    fontWeight: normal,
    color: AppColors.blackColor,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: secondary,
    fontSize: size12,
    fontWeight: normal,
    color: AppColors.blackColor,
  );

  static const TextStyle labelLarge = TextStyle(
    fontFamily: secondary,
    fontSize: size14,
    fontWeight: medium,
    color: AppColors.blackColor,
  );

  static const TextStyle labelMedium = TextStyle(
    fontFamily: secondary,
    fontSize: size12,
    fontWeight: medium,
    color: AppColors.blackColor,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: secondary,
    fontSize: size10,
    fontWeight: medium,
    color: AppColors.blackColor,
  );
}
