import 'package:crypto_exchange_app/core/constants/app_colors.dart';
import 'package:crypto_exchange_app/shared/app_text_style.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String content;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final Color? textColor;

  const AppButton({
    required this.content,
    required this.onTap,
    this.backgroundColor,
    this.textColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: screenWidth - 60,
        height: 48,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColorPath.blue,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Center(
          child: Text(
            content,
            style: AppTextStyle.textFont16W500.copyWith(
              color: textColor ?? AppColorPath.white,
            ),
          ),
        ),
      ),
    );
  }
}
