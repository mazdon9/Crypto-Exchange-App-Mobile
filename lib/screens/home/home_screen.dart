import 'package:crypto_exchange_app/core/constants/app_colors.dart';
import 'package:crypto_exchange_app/core/constants/app_paths.dart';
import 'package:crypto_exchange_app/core/extensions/context_extensions.dart';
import 'package:crypto_exchange_app/screens/home/widgets/home_appbar_widget.dart';
import 'package:crypto_exchange_app/shared/app_text_style.dart';
import 'package:flutter/material.dart';

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
    final isDarkMode = context.theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: const HomeAppbarWidget(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Portfolio Balance Title
            Center(
              child: Text(
                'Portfolio Balance',
                style: AppTextStyle.textFont16W400.copyWith(
                  color: context.theme.textTheme.bodyLarge?.color,
                ),
              ),
            ),
            const SizedBox(height: 8),

            // 2. Balance Amount
            Center(
              child: Text(
                '\$2,760.23',
                style: AppTextStyle.textFont32W600.copyWith(
                  color: context.theme.textTheme.headlineLarge?.color,
                ),
              ),
            ),
            const SizedBox(height: 4),

            // 3. Percentage Change
            Center(
              child: Text(
                '+2.60%',
                style: AppTextStyle.textFont14W400.copyWith(
                  color: Colors.green,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 4. Portfolio Graph Image
            Center(
              child: Image.asset(
                AppPaths.portfolioGraphImages,
                height: (128 / 812) * context.screenHeight,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 24),

            // 5. Market Movers Row
            _buildTitleListCoinsWidget(context, title: 'Market Movers'),
            const SizedBox(height: 16),

            // 6. Market Movers Horizontal ListView
            SizedBox(
              height: (172 / 812) * context.screenHeight,
              // Adjust height based on screen size
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                separatorBuilder: (context, index) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  return Container(
                    width: (156 / 375) * context.screenWidth,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color:
                          isDarkMode ? const Color(0xFF1E1E2E) : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isDarkMode
                            ? Colors.white.withAlpha(10)
                            : AppColorPath.black.withAlpha(10),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Text 1',
                                    style: AppTextStyle.textFont12W400.copyWith(
                                      color: context
                                          .theme.textTheme.bodyMedium?.color,
                                    ),
                                  ),
                                  Text(
                                    'Text 2',
                                    style: AppTextStyle.textFont12W400.copyWith(
                                      color: context
                                          .theme.textTheme.bodyLarge?.color,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'Text 3',
                                    style: AppTextStyle.textFont12W400.copyWith(
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Crypto icon
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.currency_bitcoin,
                                color: Colors.white,
                                size: 16,
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
                        // Bottom texts
                        Text(
                          'Text',
                          style: AppTextStyle.textFont12W400.copyWith(
                            color: context.theme.textTheme.bodyMedium?.color
                                ?.withAlpha(70),
                          ),
                        ),
                        Text(
                          'Text',
                          style: AppTextStyle.textFont12W400.copyWith(
                            color: context.theme.textTheme.bodyMedium?.color
                                ?.withAlpha(70),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),

            // 7. Portfolio Row
            _buildTitleListCoinsWidget(context, title: 'Portfolio'),
            const SizedBox(height: 16),

            // 8. Portfolio Vertical ListView
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: 5,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isDarkMode ? AppColorPath.darkLight : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isDarkMode
                          ? Colors.white.withAlpha(10)
                          : AppColorPath.black.withAlpha(10),
                    ),
                  ),
                  child: Row(
                    children: [
                      // Left side with icon and name
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: index == 0 ? Colors.orange : Colors.blue,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          index == 0 ? Icons.currency_bitcoin : Icons.diamond,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 12),

                      // Crypto info
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Text Line 1',
                              style: AppTextStyle.textFont14W400.copyWith(
                                fontWeight: FontWeight.w600,
                                color: context.theme.textTheme.bodyLarge?.color,
                              ),
                            ),
                            Text(
                              'Text Line 2',
                              style: AppTextStyle.textFont12W400.copyWith(
                                color: context.theme.textTheme.bodyMedium?.color
                                    ?.withAlpha(70),
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
                            'Text Line 1',
                            style: AppTextStyle.textFont14W400.copyWith(
                              fontWeight: FontWeight.w600,
                              color: context.theme.textTheme.bodyLarge?.color,
                            ),
                          ),
                          Text(
                            'Text Line 2',
                            style: AppTextStyle.textFont12W400.copyWith(
                              color: Colors.green,
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
