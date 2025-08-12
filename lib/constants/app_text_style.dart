import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyle {
  static const TextStyle textFont28W600 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    color: AppColorPath.black,
    fontFamily: 'ReadexPro',
  );

  static const TextStyle textFont16W400 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColorPath.textSecondary,
    fontFamily: 'ReadexPro',
  );

  static const TextStyle textFont16W600 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColorPath.white,
    fontFamily: 'ReadexPro',
  );

  static const TextStyle logoText = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColorPath.primary,
    fontFamily: 'ReadexPro',
  );
}
