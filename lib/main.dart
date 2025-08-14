import 'package:crypto_exchange_app/core/router/app_router.dart';
import 'package:crypto_exchange_app/services/storage_service.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialize storageService
  await StorageService.instance.init();
  // get onboarding completed
  final isCompletedOnboarding =
      await StorageService.instance.getOnboardingCompleted();
  runApp(CryptoExchangeApp(isCompletedOnboarding: isCompletedOnboarding));
}

class CryptoExchangeApp extends StatelessWidget {
  final bool isCompletedOnboarding;

  const CryptoExchangeApp({
    required this.isCompletedOnboarding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crypto Exchange App',
      theme: ThemeData(
        fontFamily: 'ReadexPro',
        useMaterial3: true,
      ),
      initialRoute: isCompletedOnboarding
          ? AppRoutes.dashboardScreenRouter
          : AppRoutes.onboardingScreenRouter,
      routes: AppRoutes.routes,
    );
  }
}
