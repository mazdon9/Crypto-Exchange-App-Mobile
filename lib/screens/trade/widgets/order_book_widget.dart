import 'package:crypto_exchange_app/core/extensions/context_extensions.dart';
import 'package:crypto_exchange_app/shared/app_text_style.dart';
import 'package:flutter/material.dart';

class OrderBookWidget extends StatelessWidget {
  final String selectedOrderType;
  final String selectedUnit;
  final VoidCallback onOrderTypeTap;
  final VoidCallback onUnitTap;

  const OrderBookWidget({
    super.key,
    required this.selectedOrderType,
    required this.selectedUnit,
    required this.onOrderTypeTap,
    required this.onUnitTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Order Bk No. and Unit Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Order Bk No.',
              style: context.theme.textTheme.bodyMedium,
            ),
            Text(
              'Unit',
              style: context.theme.textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(height: 8),

        // Dropdown Row
        Row(
          children: [
            Flexible(
              flex: 0,
              child: GestureDetector(
                onTap: onOrderTypeTap,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: context.theme.colorScheme.outline),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        selectedOrderType,
                        style: context.theme.textTheme.bodyMedium,
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 16,
                        color: context.theme.colorScheme.onSurface,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Flexible(
              flex: 2,
              child: GestureDetector(
                onTap: onUnitTap,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: context.theme.colorScheme.outline),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          selectedUnit,
                          style: context.theme.textTheme.bodyMedium,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 16,
                        color: context.theme.colorScheme.onSurface,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Price and Amount Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Price',
              style: context.theme.textTheme.bodyMedium,
            ),
            Text(
              'Amount',
              style: context.theme.textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(height: 8),

        // Order Book Data
        Expanded(
          child: _buildOrderBookData(context),
        ),
      ],
    );
  }

  Widget _buildOrderBookData(BuildContext context) {
    // Sample order book data
    final orderBookData = [
      {'price': '30,113.84', 'amount': '1.76676', 'color': Colors.red},
      {'price': '30,114.84', 'amount': '2.20046', 'color': Colors.red},
      {'price': '30,113.97', 'amount': '9.25520', 'color': Colors.red},
      {'price': '30,113.87', 'amount': '6.98039', 'color': Colors.red},
      {'price': '30,114.71', 'amount': '6.14111', 'color': Colors.red},
      {'price': '30,114.22', 'amount': '2.21189', 'color': Colors.red},
      {'price': '30,114.41', 'amount': '3.00018', 'color': Colors.red},
      {'price': '30,114.36', 'amount': '9.92881', 'color': Colors.red},
      {'price': '30,113.99', 'amount': '1.18708', 'color': Colors.red},
      {'price': '30,113.88', 'amount': '4.49994', 'color': Colors.red},
      {'price': '30,113.79', 'amount': '9.70443', 'color': Colors.green},
      {'price': '30,113.70', 'amount': '6.29631', 'color': Colors.green},
      {'price': '30,113.66', 'amount': '6.28200', 'color': Colors.green},
      {'price': '30,112.45', 'amount': '2.18599', 'color': Colors.green},
      {'price': '30,112.95', 'amount': '2.74875', 'color': Colors.green},
      {'price': '30,113.55', 'amount': '7.14350', 'color': Colors.green},
      {'price': '30,113.75', 'amount': '1.05598', 'color': Colors.green},
      {'price': '30,113.66', 'amount': '9.43509', 'color': Colors.green},
      {'price': '30,113.80', 'amount': '1.16627', 'color': Colors.green},
      {'price': '30,113.80', 'amount': '2.93046', 'color': Colors.green},
    ];

    return ListView.builder(
      itemCount: orderBookData.length,
      itemBuilder: (context, index) {
        final data = orderBookData[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 1),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  data['price'] as String,
                  style: AppTextStyle.textFont12W400.copyWith(
                    color: data['color'] as Color,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Expanded(
                child: Text(
                  data['amount'] as String,
                  style: AppTextStyle.textFont12W400.copyWith(
                    color: context.theme.textTheme.bodyMedium?.color,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
