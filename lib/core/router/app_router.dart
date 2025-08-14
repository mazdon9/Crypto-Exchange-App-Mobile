import 'package:crypto_exchange_app/screens/onboarding/onboarding_screen.dart';

class AppRoutes {
  static const String onboardingScreenRouter = 'onboarding-screen';

  static final routes = {
    onboardingScreenRouter: (context) => const OnboardingScreen(),
  };
}
