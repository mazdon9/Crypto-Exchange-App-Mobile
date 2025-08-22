import 'package:crypto_exchange_app/core/extensions/context_extension.dart';
import 'package:crypto_exchange_app/models/ticker.dart';
import 'package:crypto_exchange_app/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectionBottomSheet extends StatelessWidget {
  final String title;
  final List<String> items;
  final String selectedItem;
  final Function(String) onItemSelected;

  const SelectionBottomSheet({
    super.key,
    required this.title,
    required this.items,
    required this.selectedItem,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    final tickerList = Provider.of<HomeProvider>(context).tickerList;
    return Container(
      padding: const EdgeInsets.all(50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: context.theme.textTheme.headlineMedium,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              itemCount: items.length,
              separatorBuilder: (context, index) => const SizedBox(
                height: 4,
              ),
              itemBuilder: (context, index) {
                final symbol = items[index].replaceAll('/', '').toUpperCase();
                final ticker = tickerList.firstWhere(
                  (t) => t.symbol.toUpperCase() == symbol,
                  orElse: () => Ticker(
                      symbol: '--',
                      lastPrice: '--',
                      priceChangePercent: '0',
                      volume: '0'),
                );
                return ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                  title: Row(
                    children: [
                      // Tên coin bên trái
                      Expanded(
                        child: Text(
                          items[index],
                          style: context.theme.textTheme.bodyLarge
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                      // Giá bên phải
                      Column(
                        children: [
                          Text(
                            ticker.lastPrice,
                            style: context.theme.textTheme.bodyLarge
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '${ticker.priceChangePercent.startsWith('-') ? '' : '+'}${ticker.priceChangePercent}%',
                            style: context.theme.textTheme.bodySmall?.copyWith(
                              color: ticker.priceChangePercent.startsWith('-')
                                  ? Colors.red
                                  : Colors.green,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  onTap: () {
                    onItemSelected(items[index]);
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  static void show({
    required BuildContext context,
    required String title,
    required List<String> items,
    required String selectedItem,
    required Function(String) onItemSelected,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: context.theme.colorScheme.surface,
      builder: (context) => SelectionBottomSheet(
        title: title,
        items: items,
        selectedItem: selectedItem,
        onItemSelected: onItemSelected,
      ),
    );
  }
}
