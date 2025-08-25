import 'package:crypto_exchange_app/core/constants/app_colors.dart';
import 'package:crypto_exchange_app/providers/favorite_provider.dart';
import 'package:crypto_exchange_app/shared/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_alt_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Consumer<FavoriteProvider>(
        builder: (context, provider, child) {
          final favorites = provider.favorites;
          if (favorites.isEmpty) {
            return const Center(child: Text('No favorites yet'));
          }
          return Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child:
                          Text('Pair USDT', style: AppTextStyle.textFont14W400),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text('Last Price',
                          style: AppTextStyle.textFont14W400),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text('24H Change',
                          style: AppTextStyle.textFont14W400),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  itemCount: favorites.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final ticker = favorites[index];
                    return Slidable(
                      key: ValueKey(ticker.symbol),
                      motion: const DrawerMotion(),
                      actions: [
                        SlidableAction(
                          onPressed: (_) =>
                              provider.removeFavorite(ticker.symbol),
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Remove',
                        ),
                      ],
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.03),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Pair & Vol
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    ticker.symbol.replaceAll('USDT', '/USDT'),
                                    style: AppTextStyle.textFont16W600,
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    'Vol ${ticker.volume}',
                                    style: AppTextStyle.textFont12W400
                                        .copyWith(color: AppColorPath.grey),
                                  ),
                                ],
                              ),
                            ),
                            // Price & Change
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    ticker.lastPrice,
                                    style: AppTextStyle.textFont16W600,
                                  ),
                                  const SizedBox(height: 2),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: ticker.priceChangePercent
                                              .startsWith('-')
                                          ? Colors.red
                                          : Colors.green,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      '${ticker.priceChangePercent.startsWith('-') ? '' : '+'}${ticker.priceChangePercent}%',
                                      style: AppTextStyle.textFont12W600
                                          .copyWith(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
