import 'package:crypto_exchange_app/core/constants/app_colors.dart';
import 'package:crypto_exchange_app/core/constants/app_paths.dart';
import 'package:crypto_exchange_app/screens/home/home_screen.dart';
import 'package:crypto_exchange_app/screens/trade/trade_screen.dart';
import 'package:crypto_exchange_app/shared/app_text_style.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  // Method to get current screen based on selected index
  Widget _getCurrentScreen() {
    switch (_selectedIndex) {
      case 0:
        return const HomeScreen();
      case 1:
        return const TradeScreen();
      case 2:
        return const Center(child: Text('Market Screen'));
      case 3:
        return const Center(child: Text('Favorites Screen'));
      case 4:
        return const Center(child: Text('Wallet Screen'));
      default:
        return const HomeScreen();
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // TODO: Implement navigation logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: _getCurrentScreen(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).colorScheme.surface,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: AppColorPath.blue,
        unselectedItemColor: Theme.of(context).colorScheme.onSurfaceVariant,
        selectedLabelStyle: AppTextStyle.textFont12W400.copyWith(
          color: AppColorPath.blue,
        ),
        unselectedLabelStyle: AppTextStyle.textFont12W400.copyWith(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
        items: [
          _buildBottomNavigationBarItemWidget(index: 0),
          _buildBottomNavigationBarItemWidget(index: 1),
          _buildBottomNavigationBarItemWidget(index: 2),
          _buildBottomNavigationBarItemWidget(index: 3),
          _buildBottomNavigationBarItemWidget(index: 4)
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItemWidget({
    required int index,
  }) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        _bottomNavigationBarItemIconPath(index),
        width: 24,
        height: 24,
        color: _selectedIndex == index
            ? AppColorPath.blue
            : Theme.of(context).colorScheme.onSurfaceVariant,
      ),
      label: _buildBottomNavigationBarItemLabel(index),
    );
  }

  String _bottomNavigationBarItemIconPath(int index) {
    switch (index) {
      case 0:
        return AppPaths.homeIcon;
      case 1:
        return AppPaths.tradeIcon;
      case 2:
        return AppPaths.vectorIcon;
      case 3:
        return AppPaths.favoritesIcon;
      case 4:
        return AppPaths.walletIcon;
      default:
        return AppPaths.homeIcon;
    }
  }

  String _buildBottomNavigationBarItemLabel(int index) {
    switch (index) {
      case 0:
        return 'Home';
      case 1:
        return 'Trade';
      case 2:
        return 'Market';
      case 3:
        return 'Favorites';
      case 4:
        return 'Wallet';
      default:
        return 'Home';
    }
  }
}
