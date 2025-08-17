import 'package:crypto_exchange_app/core/constants/app_colors.dart';
import 'package:crypto_exchange_app/shared/app_text_style.dart';
import 'package:flutter/material.dart';

class AppTheme {
  /// Dark Theme
  ThemeData get darkTheme => ThemeData(
        scaffoldBackgroundColor: AppColorPath.darkBackground,
        appBarTheme:
            const AppBarTheme(backgroundColor: AppColorPath.darkBackground),
        colorScheme: const ColorScheme.dark(
          primary: AppColorPath.blue,
          surface: AppColorPath.darkBackground,
          onSurface: AppColorPath.darkLight,
        ),
        textTheme: TextTheme(
          headlineLarge: AppTextStyle.textFont32W600.copyWith(
            color: AppColorPath.white,
          ),
          bodyMedium: AppTextStyle.textFont16W500.copyWith(
            color: AppColorPath.white,
          ),
          bodyLarge: AppTextStyle.textFont28W600.copyWith(
            color: AppColorPath.white,
          ),
          bodySmall: AppTextStyle.textFont14W400.copyWith(
            color: AppColorPath.white,
          ),
        ),
      );

  /// Light Theme
  ThemeData get lightTheme => ThemeData(
        scaffoldBackgroundColor: AppColorPath.white,
        appBarTheme: const AppBarTheme(backgroundColor: AppColorPath.white),
        textTheme: TextTheme(
          bodyMedium: AppTextStyle.textFont16W500.copyWith(
            color: AppColorPath.black,
          ),
          bodyLarge: AppTextStyle.textFont28W600.copyWith(
            color: AppColorPath.black,
          ),
          bodySmall: AppTextStyle.textFont14W400.copyWith(
            color: AppColorPath.black,
          ),
        ),
      );
}
