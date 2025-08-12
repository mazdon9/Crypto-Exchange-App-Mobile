import 'package:flutter/material.dart';

import 'screens/splash_screen.dart';

void main() {
  runApp(const CryptoExchangeApp());
}

class CryptoExchangeApp extends StatelessWidget {
  const CryptoExchangeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crypto Exchange App',
      theme: ThemeData(
        fontFamily: 'ReadexPro',
        useMaterial3: true,
      ),
      home: const OnboardingScreen(),
    );
  }
}
