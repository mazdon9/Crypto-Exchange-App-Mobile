import 'package:crypto_exchange_app/core/constants/app_colors.dart';
import 'package:crypto_exchange_app/core/constants/app_data.dart';
import 'package:crypto_exchange_app/core/constants/app_paths.dart';
import 'package:crypto_exchange_app/core/router/app_router.dart';
import 'package:crypto_exchange_app/models/onboarding_data.dart';
import 'package:crypto_exchange_app/services/storage_service.dart';
import 'package:crypto_exchange_app/shared/app_button.dart';
import 'package:crypto_exchange_app/shared/app_text_style.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<OnboardingData> _pages = AppData().onboardingDataList;

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
                    AppPaths.coinmoneyIconLogo,
                    width: 25,
                    height: 28,
                  ),
                  const SizedBox(width: 8),
                  Image.asset(
                    AppPaths.coinmoneyTextLogo,
                    width: 120,
                    height: 20,
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
                  const SizedBox(height: 24),
                  AppButton(
                    title: _currentPage == _pages.length - 1
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

  Padding _buildPageContent(OnboardingData data) {
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

  Row _buildPageIndicator() {
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

  Future<void> _nextPage() async {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushNamed(context, AppRoutes.dashboardScreenRouter);
      await _finishOnboarding();
    }
  }

  Future<void> _finishOnboarding() async {
    // Navigate to main app
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Welcome to Crypto Exchange App!')),
    );
    // save onboarding completed
    await StorageService.instance.setOnboardingCompleted();
  }
}
