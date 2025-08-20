import 'package:crypto_exchange_app/core/constants/app_colors.dart';
import 'package:crypto_exchange_app/core/extensions/context_extension.dart';
import 'package:crypto_exchange_app/shared/app_text_style.dart';
import 'package:flutter/material.dart';

class OpenOrdersRowWidget extends StatelessWidget {
  final VoidCallback onMoreTap;

  const OpenOrdersRowWidget({
    super.key,
    required this.onMoreTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 16),
        Text(
          'Open Orders',
          style: context.theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: onMoreTap,
          child: Text(
            'More',
            style: AppTextStyle.textFont14W400.copyWith(
              color: AppColorPath.blue,
            ),
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
