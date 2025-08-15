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
        title: const Text('Coming Soon'),
        content: const Text('Opps! This feature will be updated later...'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  color: AppColorPath.black,
                ),
              ),
            ),
            const SizedBox(height: 8),

            // 2. Balance Amount
            Center(
              child: Text(
                '\$2,760.23',
                style: AppTextStyle.textFont32W600.copyWith(
                  color: AppColorPath.black,
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
            _buildTitleListCoinsWidget(context, title: 'Portfolio'),
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
                      color: AppColorPath.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: AppColorPath.black.withAlpha(20),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Row with texts and icon (to be added later)
                        Row(
                          children: [
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Text 1',
                                    style: AppTextStyle.textFont12W400,
                                  ),
                                  Text(
                                    'Text 2',
                                    style: AppTextStyle.textFont12W400,
                                  ),
                                  Text(
                                    'Text 3',
                                    style: AppTextStyle.textFont12W400,
                                  ),
                                ],
                              ),
                            ),
                            // Icon space (to be added later)
                            Container(
                              width: 20,
                              height: 20,
                              color: Colors.red[300],
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
                        const Text(
                          'Text ',
                          style: AppTextStyle.textFont12W400,
                        ),
                        const Text(
                          'Text ',
                          style: AppTextStyle.textFont12W400,
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
              itemCount: 20,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColorPath.black.withOpacity(0.1),
                    ),
                  ),
                  child: Row(
                    children: [
                      // First Column
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Text Line 1',
                              style: AppTextStyle.textFont14W400.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Text(
                              'Text Line 2',
                              style: AppTextStyle.textFont12W400,
                            ),
                          ],
                        ),
                      ),
                      // Second Column
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Text Line 1',
                            style: AppTextStyle.textFont14W400.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Text(
                            'Text Line 2',
                            style: AppTextStyle.textFont12W400,
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
            color: AppColorPath.black,
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
