import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants/app_colors.dart';
final appTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    color: AppColors.background,
    iconTheme: IconThemeData(color: AppColors.white),
    actionsIconTheme: IconThemeData(color: AppColors.white)
  ),
  scaffoldBackgroundColor: AppColors.background,
  textTheme: GoogleFonts.openSansTextTheme(
    const TextTheme(
      titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: AppColors.white),
      titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,color: AppColors.white),
      titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.normal,color: AppColors.white),
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal,color: AppColors.white),
      bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.white),
    ),
  ),
  useMaterial3: true,
);
