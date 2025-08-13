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
          'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit. Ut eget mauris massa pharetra.',
    ),
    OnboardingData(
      imagePath: AppImagesPath.phoneWithTradingImages,
      title: 'Smart trading tools',
      subtitle:
          'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit. Ut eget mauris massa pharetra.',
    ),
    OnboardingData(
      imagePath: AppImagesPath.laptopTechImages,
      title: 'Invest in the future',
      subtitle:
          'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit. Ut eget mauris massa pharetra.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorPath.lightWhite,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Header with logo centered
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImagesPath.coinmoneyIconLogo,
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'CoinMoney',
                    style: AppTextStyle.logoText,
                  )
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
                  const SizedBox(height: 24),
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
                      color: AppColorPath.blue.withAlpha(10),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            data.title,
            style: AppTextStyle.textFont32W600,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            data.subtitle,
            style: AppTextStyle.textFont14W400,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _pages.length,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: index == _currentPage ? 16 : 8,
          height: 3,
          decoration: BoxDecoration(
            color: index == _currentPage
                ? AppColorPath.blue
                : AppColorPath.black.withAlpha(30),
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
