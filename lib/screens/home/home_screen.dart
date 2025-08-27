import 'package:crypto_exchange_app/core/constants/app_colors.dart';
import 'package:crypto_exchange_app/core/constants/app_paths.dart';
import 'package:crypto_exchange_app/core/extensions/context_extension.dart';
import 'package:crypto_exchange_app/providers/home_provider.dart';
import 'package:crypto_exchange_app/screens/home/widgets/home_appbar_widget.dart';
import 'package:crypto_exchange_app/shared/app_text_style.dart';
import 'package:flutter/material.dart';
// Add Provider and HomeProvider imports for Consumer widget
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _showComingSoonDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        title: Text(
          'Coming Soon',
          style: TextStyle(color: context.theme.textTheme.bodyLarge?.color),
        ),
        content: Text(
          'Opps! This feature will be updated later...',
          style: TextStyle(color: context.theme.textTheme.bodyMedium?.color),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'OK',
              style: TextStyle(color: AppColorPath.blue),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Use Consumer to get HomeProvider data
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) {
        final tickerList = homeProvider.tickerList;
        // Calculate portfolio balance and percent from tickerList
        double percentChange = 0;
        if (tickerList.isNotEmpty) {
          // Example: sum lastPrice for demo, you should use your real logic
          // tickerList
          //     .map((e) => double.tryParse(e.lastPrice) ?? 0)
          //     .reduce((a, b) => a + b);
          percentChange = tickerList
                  .map((e) => double.tryParse(e.priceChangePercent) ?? 0)
                  .reduce((a, b) => a + b) /
              tickerList.length;
        }
        return Scaffold(
          backgroundColor: context.theme.scaffoldBackgroundColor,
          appBar: const HomeAppbarWidget(),
          body: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Portfolio Balance Title
                Center(
                  child: Text(
                    'Portfolio Balance',
                    style: AppTextStyle.textFont16W400.copyWith(
                      color: context.theme.textTheme.bodyLarge?.color,
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                // Portfolio Balance Value
                Center(
                  child: Text(
                    // Show real portfolio balance
                    " \$2,760.23",
                    style: AppTextStyle.textFont32W600.copyWith(
                      color: context.theme.textTheme.headlineLarge?.color,
                    ),
                  ),
                ),
                const SizedBox(height: 4),

                // Portfolio Percent Change
                Center(
                  child: Text(
                    // Show real percent change
                    '${percentChange >= 0 ? '+' : ''}${percentChange.toStringAsFixed(2)}%',
                    style: AppTextStyle.textFont14W400.copyWith(
                      color: percentChange >= 0 ? Colors.green : Colors.red,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Portfolio Graph Image
                Center(
                  child: Image.asset(
                    AppPaths.portfolioGraphImages,
                    height: (128 / 812) * context.screenHeight,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 24),

                // Market Movers Row
                _buildTitleListCoinsWidget(context, title: 'Market Movers'),
                const SizedBox(height: 16),

                // Market Movers Horizontal ListView
                SizedBox(
                  height: (172 / 812) * context.screenHeight,
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    scrollDirection: Axis.horizontal,
                    itemCount: tickerList.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      final ticker = tickerList[index];
                      // Format volume: thousand separator, remove trailing zeros
                      String formatVolume(String volume) {
                        final numValue = double.tryParse(volume) ?? 0;
                        // Remove trailing zeros and format with space separator
                        final intValue = numValue.truncate();
                        final formatted = intValue.toString().replaceAllMapped(
                              RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                              (Match m) => '${m[1]} ',
                            );
                        return formatted;
                      }

                      return Container(
                        width: (156 / 375) * context.screenWidth,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: context.theme.colorScheme.surface,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: context.theme.colorScheme.outline,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Row with crypto info
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        ticker.symbol
                                            .replaceAll('USDT', '/USDT'),
                                        style: AppTextStyle.textFont16W400
                                            .copyWith(
                                          color: context.theme.textTheme
                                              .bodyMedium?.color,
                                        ),
                                      ),
                                      Text(
                                        // Show lastPrice with 2 decimal places
                                        double.tryParse(ticker.lastPrice) !=
                                                null
                                            ? double.parse(ticker.lastPrice)
                                                .toStringAsFixed(2)
                                            : ticker.lastPrice,
                                        style: AppTextStyle.textFont16W400
                                            .copyWith(
                                          color: context
                                              .theme.textTheme.bodyLarge?.color,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        '${ticker.priceChangePercent.startsWith('-') ? '' : '+'}${ticker.priceChangePercent}%',
                                        style: AppTextStyle.textFont16W400
                                            .copyWith(
                                          color: ticker.priceChangePercent
                                                  .startsWith('-')
                                              ? Colors.red
                                              : Colors.green,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Crypto icon: use coinmoneyIconLogo
                                SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Image.asset(
                                    AppPaths.coinmoneyIconLogo,
                                    width: 16,
                                    height: 16,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            // Mini graph image
                            Center(
                              child: Image.asset(
                                AppPaths.miniGraphImages,
                                width: 85,
                                height: 36,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 4),
                            // Bottom text: formatted volume only
                            Text(
                              '24H Vol.\n${formatVolume(ticker.volume)}',
                              style: AppTextStyle.textFont12W400.copyWith(
                                color:
                                    context.theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                            // Removed coin name line below volume
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 24),

                // Portfolio Row
                _buildTitleListCoinsWidget(context, title: 'Portfolio'),
                const SizedBox(height: 16),

                // Portfolio Vertical ListView
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: tickerList.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final ticker = tickerList[index];
                    // Show real ticker data
                    return Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: context.theme.colorScheme.surface,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: context.theme.colorScheme.outline,
                        ),
                      ),
                      child: Row(
                        children: [
                          // Left side with icon and name
                          SizedBox(
                            width: 40,
                            height: 40,
                            child: Image.asset(
                              AppPaths.coinmoneyIconLogo,
                              width: 24,
                              height: 24,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(width: 12),

                          // Crypto info
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ticker.symbol.replaceAll('USDT', ''),
                                  style: AppTextStyle.textFont14W400.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: context
                                        .theme.textTheme.bodyLarge?.color,
                                  ),
                                ),
                                Text(
                                  ticker.symbol,
                                  style: AppTextStyle.textFont12W400.copyWith(
                                    color: context
                                        .theme.colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Price and change
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                ' \$${double.tryParse(ticker.lastPrice) != null ? double.parse(ticker.lastPrice).toStringAsFixed(2) : ticker.lastPrice}',
                                style: AppTextStyle.textFont14W400.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color:
                                      context.theme.textTheme.bodyLarge?.color,
                                ),
                              ),
                              Text(
                                '${ticker.priceChangePercent.startsWith('-') ? '' : '+'}${ticker.priceChangePercent}%',
                                style: AppTextStyle.textFont12W400.copyWith(
                                  color:
                                      ticker.priceChangePercent.startsWith('-')
                                          ? Colors.red
                                          : Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Row _buildTitleListCoinsWidget(
    BuildContext context, {
    required String title,
  }) {
    return Row(
      children: [
        const SizedBox(width: 16),
        Text(
          title,
          style: AppTextStyle.textFont16W400.copyWith(
            color: context.theme.textTheme.bodyLarge?.color,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () => _showComingSoonDialog(context),
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
