import 'package:crypto_exchange_app/core/constants/app_paths.dart';
import 'package:crypto_exchange_app/screens/settings/setting_screen.dart';
import 'package:flutter/material.dart';

class HomeAppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
        IconButton(
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
      ],
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight); // Or a custom height like 80.0
}
