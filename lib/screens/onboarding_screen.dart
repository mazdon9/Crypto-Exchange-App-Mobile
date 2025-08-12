import 'package:flutter/material.dart';

import '../components/app_button.dart';
import '../constants/app_colors.dart';
import '../constants/app_paths.dart';
import '../constants/app_text_style.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingData> _pages = [
    OnboardingData(
      imagePath: AppImagesPath.manWithCircleImages,
      title: 'Take hold of your finances',
      subtitle:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut eget mauris massa pharetra.',
    ),
    OnboardingData(
      imagePath: AppImagesPath.phoneWithTradingImages,
      title: 'Smart trading tools',
      subtitle:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut eget mauris massa pharetra.',
    ),
    OnboardingData(
      imagePath: AppImagesPath.laptopTechImages,
      title: 'Invest in the future',
      subtitle:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut eget mauris massa pharetra.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorPath.lightWhite,
      body: SafeArea(
        child: Column(
          children: [
            // Header with logo and skip
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                children: [
                  Image.asset(
                    AppImagesPath.coinmoneyLogo,
                    width: 40,
                    height: 40,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.currency_bitcoin,
                        color: AppColorPath.primary,
                        size: 40,
                      );
                    },
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'coinmoney',
                    style: AppTextStyle.logoText,
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: _finishOnboarding,
                    child: const Text(
                      'Skip',
                      style: AppTextStyle.textFont16W400,
                    ),
                  ),
                ],
              ),
            ),

            // PageView
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  return _buildPageContent(_pages[index]);
                },
              ),
            ),

            // Indicator and button
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  _buildPageIndicator(),
                  const SizedBox(height: 32),
                  AppButton(
                    content: _currentPage == _pages.length - 1
                        ? 'Get Started'
                        : 'Next',
                    onTap: _nextPage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageContent(OnboardingData data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                data.imagePath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    decoration: BoxDecoration(
                      color: AppColorPath.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      _getIconForPage(_currentPage),
                      size: 100,
                      color: AppColorPath.primary,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 60),
          Text(
            data.title,
            style: AppTextStyle.textFont28W600,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            data.subtitle,
            style: AppTextStyle.textFont16W400,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  IconData _getIconForPage(int index) {
    switch (index) {
      case 0:
        return Icons.account_balance_wallet;
      case 1:
        return Icons.trending_up;
      case 2:
        return Icons.rocket_launch;
      default:
        return Icons.currency_bitcoin;
    }
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _pages.length,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: index == _currentPage ? 16 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: index == _currentPage
                ? AppColorPath.primary
                : AppColorPath.textSecondary,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _finishOnboarding();
    }
  }

  void _finishOnboarding() {
    // Navigate to main app
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Welcome to Crypto Exchange App!')),
    );
  }
}

class OnboardingData {
  final String imagePath;
  final String title;
  final String subtitle;

  OnboardingData({
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });
}
