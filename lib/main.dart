import 'package:crypto_exchange_app/core/router/app_router.dart';
import 'package:crypto_exchange_app/providers/home_provider.dart';
import 'package:crypto_exchange_app/repositories/ticker_repository.dart';
import 'package:crypto_exchange_app/services/binance_websocket_service.dart';
import 'package:crypto_exchange_app/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// init StorageService
  await StorageService.instance.init();

  /// get onboarding completed
  final isCompletedOnboarding =
      await StorageService.instance.getOnboardingCompleted();

  runApp(CryptoExchangeApp(isCompletedOnboarding: isCompletedOnboarding));
}

class CryptoExchangeApp extends StatelessWidget {
  final bool isCompletedOnboarding;
  const CryptoExchangeApp({required this.isCompletedOnboarding, super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => BinanceWebsocketService()),
        Provider(
          create: (context) =>
              TickerRepository(context.read<BinanceWebsocketService>()),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeProvider(context.read<TickerRepository>()),
        ),
      ],
      child: MaterialApp(
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
      ),
    );
  }
}
