import 'package:crypto_exchange_app/core/constants/app_colors.dart';
import 'package:crypto_exchange_app/core/constants/app_paths.dart';
import 'package:crypto_exchange_app/screens/home/home_screen.dart';
import 'package:crypto_exchange_app/screens/settings/setting_screen.dart';
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
        return const Center(child: Text('Trade Screen'));
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(
            AppPaths.profileIcon,
            width: 20,
            height: 20,
          ),
        ),
        title: Row(
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
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: IconButton(
              icon: Image.asset(
                AppPaths.settingsIcon,
                width: 24,
                height: 24,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: _getCurrentScreen(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: AppTextStyle.textFont12W400.copyWith(
          color: Colors.blue,
        ),
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              AppPaths.homeIcon,
              width: 24,
              height: 24,
              color:
                  _selectedIndex == 0 ? AppColorPath.blue : AppColorPath.black,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AppPaths.tradeIcon,
              width: 24,
              height: 24,
              color:
                  _selectedIndex == 1 ? AppColorPath.blue : AppColorPath.black,
            ),
            label: 'Trade',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AppPaths.vectorIcon,
              width: 24,
              height: 24,
              color:
                  _selectedIndex == 2 ? AppColorPath.blue : AppColorPath.black,
            ),
            label: 'Market',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AppPaths.favoritesIcon,
              width: 24,
              height: 24,
              color:
                  _selectedIndex == 3 ? AppColorPath.blue : AppColorPath.black,
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AppPaths.walletIcon,
              width: 24,
              height: 24,
              color:
                  _selectedIndex == 4 ? AppColorPath.blue : AppColorPath.black,
            ),
            label: 'Wallet',
          ),
        ],
      ),
    );
  }
}
