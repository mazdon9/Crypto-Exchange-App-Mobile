import 'package:crypto_exchange_app/core/extensions/context_extension.dart';
import 'package:crypto_exchange_app/shared/app_text_style.dart';
import 'package:flutter/material.dart';

class TradeInputBoxWidget extends StatelessWidget {
  final String value;
  final String currency;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const TradeInputBoxWidget({
    super.key,
    required this.value,
    required this.currency,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      height: (32 / 812) * MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: context.theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: context.theme.colorScheme.outline.withAlpha(10),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: context.theme.colorScheme.onSurface.withAlpha(10),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Decrease Button
          GestureDetector(
            onTap: onDecrease,
            child: Container(
              padding: const EdgeInsets.all(4),
              child: Icon(
                Icons.remove,
                size: 16,
                color: context.theme.colorScheme.onSurface,
              ),
            ),
          ),

          // Value
          Text(
            value,
            style: AppTextStyle.textFont12W400.copyWith(
              fontWeight: FontWeight.w500,
              color: context.theme.colorScheme.onSurface,
            ),
          ),

          // Currency
          Text(
            currency,
            style: AppTextStyle.textFont12W400.copyWith(
              color: context.theme.colorScheme.onSurface,
            ),
          ),

          // Increase Button
          GestureDetector(
            onTap: onIncrease,
            child: Container(
              padding: const EdgeInsets.all(4),
              child: Icon(
                Icons.add,
                size: 16,
                color: context.theme.colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
