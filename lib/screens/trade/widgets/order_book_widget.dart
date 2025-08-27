import 'package:crypto_exchange_app/core/extensions/context_extension.dart';
import 'package:crypto_exchange_app/models/orderbook.dart';
import 'package:crypto_exchange_app/providers/trade_provider.dart';
import 'package:crypto_exchange_app/shared/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class OrderBookWidget extends StatelessWidget {
  // Format for Price column
  String formatPrice(String value) {
    final number = double.tryParse(value) ?? 0;
    final formatter = NumberFormat('#,##0.00');
    return formatter.format(number);
  }

  // Format for Amount column
  String formatAmount(String value) {
    final number = double.tryParse(value) ?? 0;
    return number.toStringAsFixed(4);
  }

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
      mainAxisSize: MainAxisSize.min,
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
            GestureDetector(
              onTap: onOrderTypeTap,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: BoxDecoration(
                  border: Border.all(color: context.theme.colorScheme.outline),
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
            const SizedBox(width: 8),
            GestureDetector(
              onTap: onUnitTap,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: BoxDecoration(
                  border: Border.all(color: context.theme.colorScheme.outline),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    Text(
                      selectedUnit,
                      style: context.theme.textTheme.bodyMedium,
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
          child: _buildBidOrderBookData(context),
        ),

        Expanded(
          child: _buildAskOrderBookData(context),
        ),
      ],
    );
  }

  Consumer<TradeProvider> _buildAskOrderBookData(BuildContext context) {
    return Consumer<TradeProvider>(
      builder: (_, tradeProvider, __) {
        return ListView.builder(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: tradeProvider.asks.length,
          itemBuilder: (context, index) {
            final data = tradeProvider.asks[index];
            return _buildPriceAndAmountWidget(
              context,
              data: data,
              isAsk: true,
            );
          },
        );
      },
    );
  }

  Consumer<TradeProvider> _buildBidOrderBookData(BuildContext context) {
    return Consumer<TradeProvider>(
      builder: (_, tradeProvider, __) {
        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: tradeProvider.bids.length,
          itemBuilder: (context, index) {
            final data = tradeProvider.bids[index];
            return _buildPriceAndAmountWidget(
              context,
              data: data,
              isAsk: false,
            );
          },
        );
      },
    );
  }

  Padding _buildPriceAndAmountWidget(BuildContext context,
      {required OrderbookEntry data, bool isAsk = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: Row(
        children: [
          Expanded(
            child: Text(
              formatPrice(data.price),
              style: AppTextStyle.textFont12W400.copyWith(
                color: isAsk ? Colors.green : Colors.red,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            child: Text(
              formatAmount(data.quantity),
              style: AppTextStyle.textFont12W400.copyWith(
                color: context.theme.textTheme.bodyMedium?.color,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
