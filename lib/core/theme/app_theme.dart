import 'package:crypto_exchange_app/core/constants/app_colors.dart';
import 'package:crypto_exchange_app/shared/app_text_style.dart';
import 'package:flutter/material.dart';

class AppTheme {
  /// Dark Theme
  ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColorPath.darkBackground,

        // AppBar Theme
        appBarTheme: AppBarTheme(
          backgroundColor: AppColorPath.darkBackground,
          foregroundColor: AppColorPath.white,
          elevation: 0,
          titleTextStyle: AppTextStyle.textFont16W500.copyWith(
            color: AppColorPath.white,
            fontWeight: FontWeight.w600,
          ),
        ),

        // Bottom Navigation Theme
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColorPath.darkLight,
          selectedItemColor: AppColorPath.blue,
          unselectedItemColor: AppColorPath.textSecondary,
          type: BottomNavigationBarType.fixed,
        ),

        // Card Theme
        cardTheme: CardThemeData(
          color: AppColorPath.darkLight,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: AppColorPath.white.withAlpha(25),
            ),
          ),
        ),

        // Color Scheme
        colorScheme: ColorScheme.dark(
          primary: AppColorPath.darkLight,
          onPrimary: AppColorPath.white,
          surface: AppColorPath.darkLight,
          onSurface: AppColorPath.white,
          outline: AppColorPath.white.withAlpha(25),
          onSurfaceVariant: AppColorPath.white.withAlpha(204),
        ),

        // Text Theme
        textTheme: TextTheme(
          headlineLarge: AppTextStyle.textFont32W600.copyWith(
            color: AppColorPath.white,
          ),
          headlineMedium: AppTextStyle.textFont28W600.copyWith(
            color: AppColorPath.white,
          ),
          bodyLarge: AppTextStyle.textFont16W500.copyWith(
            color: AppColorPath.white,
          ),
          bodyMedium: AppTextStyle.textFont14W400.copyWith(
            color: AppColorPath.white.withAlpha(204),
          ),
          bodySmall: AppTextStyle.textFont12W400.copyWith(
            color: AppColorPath.white.withAlpha(153),
          ),
        ),
      );

  /// Light Theme
  ThemeData get lightTheme => ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppColorPath.white,

        // AppBar Theme
        appBarTheme: AppBarTheme(
          backgroundColor: AppColorPath.white,
          foregroundColor: AppColorPath.black,
          elevation: 0,
          titleTextStyle: AppTextStyle.textFont16W500.copyWith(
            color: AppColorPath.black,
            fontWeight: FontWeight.w600,
          ),
        ),

        // Bottom Navigation Theme
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColorPath.white,
          selectedItemColor: AppColorPath.blue,
          unselectedItemColor: AppColorPath.textSecondary,
          type: BottomNavigationBarType.fixed,
        ),

        // Card Theme
        cardTheme: CardThemeData(
          color: AppColorPath.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: AppColorPath.black.withAlpha(25),
            ),
          ),
        ),

        // Color Scheme
        colorScheme: ColorScheme.light(
          primary: AppColorPath.blue,
          onPrimary: AppColorPath.white,
          surface: AppColorPath.white,
          onSurface: AppColorPath.black,
          outline: AppColorPath.black.withAlpha(25),
          onSurfaceVariant: AppColorPath.black.withAlpha(204),
        ),

        // Text Theme
        textTheme: TextTheme(
          headlineLarge: AppTextStyle.textFont32W600.copyWith(
            color: AppColorPath.black,
          ),
          headlineMedium: AppTextStyle.textFont28W600.copyWith(
            color: AppColorPath.black,
          ),
          bodyLarge: AppTextStyle.textFont16W500.copyWith(
            color: AppColorPath.black,
          ),
          bodyMedium: AppTextStyle.textFont14W400.copyWith(
            color: AppColorPath.black.withAlpha(204),
          ),
          bodySmall: AppTextStyle.textFont12W400.copyWith(
            color: AppColorPath.black.withAlpha(153),
          ),
        ),
      );
}
