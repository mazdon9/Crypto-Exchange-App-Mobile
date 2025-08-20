import 'package:crypto_exchange_app/core/constants/app_colors.dart';
import 'package:crypto_exchange_app/shared/app_text_style.dart';
import 'package:flutter/material.dart';

class PriceInfoRowWidget extends StatelessWidget {
  final String price;
  final String dollarPrice;
  final String percentage;

  const PriceInfoRowWidget({
    super.key,
    required this.price,
    required this.dollarPrice,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Flexible(
            child: Text(
              price,
              style: AppTextStyle.textFont16W500.copyWith(
                color: Colors.green,
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 4),
          Flexible(
            child: Text(
              dollarPrice,
              style: AppTextStyle.textFont14W400.copyWith(
                color: AppColorPath.textSecondary,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            percentage,
            style: AppTextStyle.textFont14W400.copyWith(
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
