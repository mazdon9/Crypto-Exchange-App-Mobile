import 'package:crypto_exchange_app/core/constants/app_paths.dart';
import 'package:crypto_exchange_app/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class TradingPairRowWidget extends StatelessWidget {
  final String selectedPair;
  final VoidCallback onPairTap;
  final VoidCallback onMarketTap;

  const TradingPairRowWidget({
    super.key,
    required this.selectedPair,
    required this.onPairTap,
    required this.onMarketTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: onPairTap,
              child: Row(
                children: [
                  Text(
                    selectedPair,
                    style: context.theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: context.theme.colorScheme.onSurface,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: onMarketTap,
            child: Image.asset(
              AppPaths.vectorIcon,
              width: 24,
              height: 24,
              color: context.theme.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
