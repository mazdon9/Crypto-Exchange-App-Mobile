import 'package:crypto_exchange_app/screens/bottom_tab/bottom_tab_screen.dart';
import 'package:crypto_exchange_app/screens/onboarding/onboarding_screen.dart';

class AppRoutes {
  static const String onboardingScreenRouter = 'onboarding-screen';
  static const String dashboardScreenRouter = 'dashboard-screen';

  static final routes = {
    onboardingScreenRouter: (context) => const OnboardingScreen(),
    dashboardScreenRouter: (context) => const DashboardScreen(),
  };
}
