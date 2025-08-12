import 'package:flutter/material.dart';

import '../screens/splash_screen.dart';
import '../screens/splash_screen.dart';

/// App routes configuration
/// Cấu hình routes cho toàn bộ ứng dụng
class AppRouter {
  // Route names - Tên các route
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String home = '/home';
  static const String login = '/login';
  static const String register = '/register';
  static const String portfolio = '/portfolio';
  static const String trade = '/trade';
  static const String profile = '/profile';

  /// Generate routes for the app
  /// Tạo routes cho ứng dụng
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return _createRoute(const SplashScreen());

      case onboarding:
        return _createRoute(const OnboardingScreen());

      // TODO: Add more routes as screens are created
      // TODO: Thêm các route khác khi các màn hình được tạo

      default:
        return _createRoute(_buildErrorScreen(settings.name));
    }
  }

  /// Create custom page route with slide transition
  /// Tạo page route tùy chỉnh với hiệu ứng slide
  static PageRouteBuilder<dynamic> _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: curve),
        );

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }

  /// Build error screen for unknown routes
  /// Xây dựng màn hình lỗi cho các route không xác định
  static Widget _buildErrorScreen(String? routeName) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            Text(
              'Route not found: ${routeName ?? 'Unknown'}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.of(_navigatorKey.currentContext!)
                    .pushNamedAndRemoveUntil(
                  splash,
                  (route) => false,
                );
              },
              child: const Text('Go to Home'),
            ),
          ],
        ),
      ),
    );
  }

  /// Global navigator key
  /// Key navigator toàn cục
  static final GlobalKey<NavigatorState> _navigatorKey =
      GlobalKey<NavigatorState>();

  static GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;
}

/// Navigation helper methods
/// Các phương thức hỗ trợ điều hướng
class AppNavigation {
  /// Navigate to splash screen
  /// Điều hướng đến màn hình splash
  static Future<void> toSplash(BuildContext context) {
    return Navigator.pushNamedAndRemoveUntil(
      context,
      AppRouter.splash,
      (route) => false,
    );
  }

  /// Navigate to onboarding screen
  /// Điều hướng đến màn hình onboarding
  static Future<void> toOnboarding(BuildContext context) {
    return Navigator.pushNamed(context, AppRouter.onboarding);
  }

  /// Navigate to home screen
  /// Điều hướng đến màn hình chính
  static Future<void> toHome(BuildContext context) {
    return Navigator.pushNamedAndRemoveUntil(
      context,
      AppRouter.home,
      (route) => false,
    );
  }

  /// Navigate back
  /// Điều hướng trở lại
  static void back(BuildContext context) {
    Navigator.pop(context);
  }

  /// Check if can navigate back
  /// Kiểm tra có thể điều hướng trở lại không
  static bool canPop(BuildContext context) {
    return Navigator.canPop(context);
  }
}
