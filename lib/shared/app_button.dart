import 'package:crypto_exchange_app/core/constants/app_colors.dart';
import 'package:crypto_exchange_app/core/enums/button_type.dart';
import 'package:crypto_exchange_app/core/extensions/context_extensions.dart';
import 'package:crypto_exchange_app/shared/app_text_style.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String content;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final Color? textColor;
  final ButtonType? buttonType;

  const AppButton({
    required this.content,
    required this.onTap,
    this.backgroundColor,
    this.textColor,
    this.buttonType,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Use buttonType if provided, otherwise use legacy behavior
    if (buttonType != null) {
      return _buildWithButtonType(context);
    } else {
      return _buildLegacy(context);
    }
  }

  Widget _buildWithButtonType(BuildContext context) {
    final type = buttonType!;

    Color bgColor;
    if (type.isSecondary) {
      // For secondary button (setting_screen), don't change the original color
      bgColor = backgroundColor ?? AppColorPath.blue;
    } else if (type.useTheme) {
      // For buttons with theme support
      bgColor = backgroundColor ?? context.theme.colorScheme.primary;
    } else {
      // For buttons without theme support
      bgColor = backgroundColor ?? AppColorPath.blue;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: type.width,
        height: type.height,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
          border: type.useTheme
              ? Border.all(
                  color: context
                          .theme.bottomNavigationBarTheme.selectedItemColor ??
                      Colors.transparent,
                  width: 2,
                )
              : null,
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

  Widget _buildLegacy(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: screenWidth - 60,
        height: 48,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColorPath.blue,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: context.theme.bottomNavigationBarTheme.selectedItemColor ??
                Colors.transparent,
            width: 2,
          ),
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
