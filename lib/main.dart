import 'package:crypto_exchange_app/core/router/app_router.dart';
import 'package:crypto_exchange_app/providers/theme_provider.dart';
import 'package:crypto_exchange_app/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: MyApp(
        isCompletedOnboarding: isCompletedOnboarding,
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  final bool isCompletedOnboarding;
  const MyApp({super.key, required this.isCompletedOnboarding});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crypto Exchange App',
      theme: context.watch<ThemeProvider>().theme,
      initialRoute: isCompletedOnboarding
          ? AppRoutes.dashboardScreenRouter
          : AppRoutes.onboardingScreenRouter,
      routes: AppRoutes.routes,
    );
  }
}
