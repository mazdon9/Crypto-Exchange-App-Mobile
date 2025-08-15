import 'package:crypto_exchange_app/screens/dashboard/dashboard_screen.dart';
import 'package:crypto_exchange_app/screens/home/home_screen.dart';
import 'package:crypto_exchange_app/screens/onboarding/onboarding_screen.dart';
import 'package:crypto_exchange_app/screens/settings/setting_screen.dart';

class AppRoutes {
  static const String onboardingScreenRouter = 'onboarding-screen';
  static const String dashboardScreenRouter = 'dashboard-screen';
  static const String homeScreenRouter = 'home-screen';
  static const String settingScreenRouter = 'setting-screen';

  static final routes = {
    onboardingScreenRouter: (context) => const OnboardingScreen(),
    dashboardScreenRouter: (context) => const DashboardScreen(),
    homeScreenRouter: (context) => const HomeScreen(),
    settingScreenRouter: (context) => const SettingScreen(),
  };
}
