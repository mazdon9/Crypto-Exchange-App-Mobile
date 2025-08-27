import 'package:crypto_exchange_app/core/extensions/context_extension.dart';
import 'package:crypto_exchange_app/models/ticker.dart';
import 'package:crypto_exchange_app/providers/favorite_provider.dart';
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
    return Consumer<FavoriteProvider>(
      builder: (context, favoriteProvider, _) {
        // Sắp xếp: coin favorite lên trên
        final sortedItems = List<String>.from(items);
        sortedItems.sort((a, b) {
          final aFav =
              favoriteProvider.isFavorite(a.replaceAll('/', '').toUpperCase());
          final bFav =
              favoriteProvider.isFavorite(b.replaceAll('/', '').toUpperCase());
          if (aFav && !bFav) return -1;
          if (!aFav && bFav) return 1;
          return 0;
        });
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
                    final symbol =
                        sortedItems[index].replaceAll('/', '').toUpperCase();
                    final ticker = tickerList.firstWhere(
                      (t) => t.symbol.toUpperCase() == symbol,
                      orElse: () => Ticker(
                          symbol: '--',
                          lastPrice: '--',
                          priceChangePercent: '0',
                          volume: '0'),
                    );
                    final isFavorite = favoriteProvider.isFavorite(symbol);
                    return ListTile(
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                      title: Row(
                        children: [
                          // Tên coin bên trái + icon ngôi sao nếu đã favorite
                          Expanded(
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    favoriteProvider
                                        .toggleFavoriteToken(symbol.toLowerCase());
                                  },
                                  child: Icon(
                                    Icons.star,
                                    color: isFavorite ? Colors.amber : Colors.grey,
                                    size: 18,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  sortedItems[index],
                                  style: context.theme.textTheme.bodyLarge
                                      ?.copyWith(fontWeight: FontWeight.w600),
                                ),
                              ],
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
                        onItemSelected(sortedItems[index]);
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
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
