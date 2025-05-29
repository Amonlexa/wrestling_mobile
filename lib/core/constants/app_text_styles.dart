// utils/app_text_styles.dart

import 'package:flutter/material.dart';

// utils/app_text_styles.dart

import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {
  // === Заголовки ===
  static TextStyle appBarTitle = GoogleFonts.openSans(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static TextStyle titleLarge = GoogleFonts.openSans(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static TextStyle titleMedium = GoogleFonts.openSans(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white70,
  );

  static TextStyle titleSmall = GoogleFonts.openSans(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.white60,
  );

  // === Основной текст ===
  static TextStyle bodyMedium = GoogleFonts.openSans(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.white60,
  );

  static TextStyle bodySmall = GoogleFonts.openSans(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: Colors.white54,
  );

  // === Ссылки и акцентный текст ===
  static const TextStyle link = TextStyle(
    fontSize: 14,
    color: Colors.cyanAccent,
    decoration: TextDecoration.underline,
  );

  static TextStyle buttonLightStyle = GoogleFonts.openSans(
    fontSize: 15,
    color: AppColors.black,
    fontWeight: FontWeight.normal
  );

  static TextStyle buttonDarkStyle = GoogleFonts.openSans(
      fontSize: 15,
      color: AppColors.white,
      fontWeight: FontWeight.normal
  );

  static TextStyle hintStyle =  GoogleFonts.openSans(
      fontSize: 13,
      color: Colors.grey,
      fontWeight: FontWeight.normal
  );
}