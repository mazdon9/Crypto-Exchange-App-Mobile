import 'package:crypto_exchange_app/core/constants/app_colors.dart';
import 'package:crypto_exchange_app/shared/app_text_style.dart';
import 'package:flutter/material.dart';

class SettingItemWidget extends StatelessWidget {
  final String iconPath;
  final String title;
  final bool hasArrow;
  final VoidCallback? onTap;
  final Widget? trailing;

  const SettingItemWidget({
    super.key,
    required this.iconPath,
    required this.title,
    this.hasArrow = true,
    this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColorPath.black.withAlpha(10),
          ),
        ),
        child: Row(
          children: [
            Image.asset(
              iconPath,
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: AppTextStyle.textFont16W400.copyWith(
                  color: AppColorPath.black,
                ),
              ),
            ),
            if (trailing != null) ...[
              trailing!,
            ] else if (hasArrow) ...[
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: AppColorPath.black.withAlpha(10),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
