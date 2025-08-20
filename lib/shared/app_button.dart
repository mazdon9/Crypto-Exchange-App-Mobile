import 'package:crypto_exchange_app/core/enums/button_type.dart';
import 'package:crypto_exchange_app/core/extensions/context_extension.dart';
import 'package:crypto_exchange_app/shared/app_text.dart';
import 'package:crypto_exchange_app/shared/app_text_style.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? onTap;
  final ButtonType buttonType;
  final double? width;
  final String? leftIconPath;
  final String? rightIconPath;
  final String title;

  const AppButton({
    this.onTap,
    this.buttonType = ButtonType.normal,
    this.width,
    this.leftIconPath,
    this.rightIconPath,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: _buildBackgroundColor(),
          border: Border.all(
            color: _buildBorderColor(context),
            width: 2,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        width: width ?? double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leftIconPath != null) ...[
              Image.asset(
                leftIconPath!,
                width: 24,
                height: 24,
              ),
              const SizedBox(
                width: 6,
              ),
            ],
            AppText(
              title: title,
              style: AppTextStyle.textFont16W500
                  .copyWith(color: _buildTitleTextColor()),
            ),
            if (rightIconPath != null) ...[
              const SizedBox(
                width: 6,
              ),
              Image.asset(
                rightIconPath!,
                width: 24,
                height: 24,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Color _buildTitleTextColor() {
    switch (buttonType) {
      case ButtonType.normal:
        return Colors.white;
      case ButtonType.disable:
        return const Color(0xFF696F8C);
      case ButtonType.second:
        return const Color(0xFF2F66F6);
    }
  }

  Color _buildBackgroundColor() {
    switch (buttonType) {
      case ButtonType.normal:
        return const Color(0xFF2F66F6);
      case ButtonType.disable:
        return const Color(0xFFD7D9E4);
      case ButtonType.second:
        return Colors.white;
    }
  }

  Color _buildBorderColor(BuildContext context) {
    switch (buttonType) {
      case ButtonType.normal:
        return const Color(0xFF2F66F6);
      case ButtonType.disable:
        return const Color(0xFFD7D9E4);
      case ButtonType.second:
        return context.theme.bottomNavigationBarTheme.selectedItemColor!;
    }
  }
}

// class AppButton extends StatelessWidget {
//   final String content;
//   final VoidCallback onTap;
//   final Color? backgroundColor;
//   final Color? textColor;
//   final ButtonType? buttonType;

//   const AppButton({
//     required this.content,
//     required this.onTap,
//     this.backgroundColor,
//     this.textColor,
//     this.buttonType,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     // Use buttonType if provided, otherwise use legacy behavior
//     if (buttonType != null) {
//       return _buildWithButtonType(context);
//     } else {
//       return _buildLegacy(context);
//     }
//   }

//   Widget _buildWithButtonType(BuildContext context) {
//     final type = buttonType!;

//     Color bgColor;
//     if (type.isSecondary) {
//       // For secondary button (setting_screen), don't change the original color
//       bgColor = backgroundColor ?? AppColorPath.blue;
//     } else if (type.useTheme) {
//       // For buttons with theme support
//       bgColor = backgroundColor ?? context.theme.colorScheme.primary;
//     } else {
//       // For buttons without theme support
//       bgColor = backgroundColor ?? AppColorPath.blue;
//     }

//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: type.width,
//         height: type.height,
//         decoration: BoxDecoration(
//           color: bgColor,
//           borderRadius: BorderRadius.circular(10),
//           border: type.useTheme
//               ? Border.all(
//                   color: context
//                           .theme.bottomNavigationBarTheme.selectedItemColor ??
//                       Colors.transparent,
//                   width: 2,
//                 )
//               : null,
//         ),
//         child: Center(
//           child: Text(
//             content,
//             style: AppTextStyle.textFont16W500.copyWith(
//               color: textColor ?? AppColorPath.white,
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildLegacy(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: screenWidth - 60,
//         height: 48,
//         decoration: BoxDecoration(
//           color: backgroundColor ?? AppColorPath.blue,
//           borderRadius: BorderRadius.circular(10),
//           border: Border.all(
//             color: context.theme.bottomNavigationBarTheme.selectedItemColor ??
//                 Colors.transparent,
//             width: 2,
//           ),
//         ),
//         child: Center(
//           child: Text(
//             content,
//             style: AppTextStyle.textFont16W500.copyWith(
//               color: textColor ?? AppColorPath.white,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
