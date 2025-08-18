import 'package:crypto_exchange_app/core/constants/app_colors.dart';
import 'package:crypto_exchange_app/core/constants/app_paths.dart';
import 'package:crypto_exchange_app/core/enums/button_type.dart';
import 'package:crypto_exchange_app/core/extensions/context_extensions.dart';
import 'package:crypto_exchange_app/models/setting_item_data.dart';
import 'package:crypto_exchange_app/screens/settings/widgets/setting_item_widget.dart';
import 'package:crypto_exchange_app/screens/settings/widgets/setting_profile_user_wiget.dart';
import 'package:crypto_exchange_app/shared/app_button.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  void _showComingSoonDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: context.theme.colorScheme.surface,
        title: Text(
          'Coming Soon',
          style: TextStyle(
            color: context.theme.colorScheme.onSurface,
          ),
        ),
        content: Text(
          'Opps! This feature will be updated later...',
          style: TextStyle(
            color: context.theme.colorScheme.onSurface,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'OK',
              style: TextStyle(
                color: AppColorPath.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }

  final List<SettingItemData> _privacyItems = [
    SettingItemData(
      iconPath: AppPaths.securityIcon,
      title: "Profile",
      onTap: () {},
    ),
    SettingItemData(
      iconPath: AppPaths.profileIcon,
      title: "Security",
      onTap: () {},
    ),
  ];

  final List<SettingItemData> _financeItems = [
    SettingItemData(
      iconPath: AppPaths.historyIcon,
      title: "History",
      onTap: () {},
    ),
    SettingItemData(
      iconPath: AppPaths.limitsIcon,
      title: "Limits",
      onTap: () {},
    ),
  ];

  final List<SettingItemData> _accountItems = [
    SettingItemData(
      iconPath: AppPaths.securityIcon,
      title: "Theme",
      onTap: () {},
      isDarkMode: true,
    ),
    SettingItemData(
      iconPath: AppPaths.bellIcon,
      title: "Notifications",
      onTap: () {},
    ),
  ];

  final List<SettingItemData> _moreItems = [
    SettingItemData(
      iconPath: AppPaths.giftIcon,
      title: "My bonus",
      onTap: () {},
    ),
    SettingItemData(
      iconPath: AppPaths.supportIcon,
      title: "Shared with friends",
      onTap: () {},
    ),
    SettingItemData(
      iconPath: AppPaths.supportIcon,
      title: "Support",
      onTap: () {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: context.theme.colorScheme.onSurface,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Settings',
          style: context.theme.textTheme.bodyMedium,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: context.theme.colorScheme.onSurface,
            ),
            onPressed: _showComingSoonDialog,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Section
            const SettingProfileUserWiget(),
            const SizedBox(height: 16),
            // Profile Section
            SettingItemWidget(
              title: 'Profile',
              items: _privacyItems,
            ),
            const SizedBox(height: 14),
            // Finance Section
            SettingItemWidget(
              title: 'Finance',
              items: _financeItems,
            ),
            const SizedBox(height: 14),
            // Account Section
            SettingItemWidget(
              title: 'Account',
              items: _accountItems,
            ),
            const SizedBox(height: 14),
            // More Section
            SettingItemWidget(
              title: 'More',
              items: _moreItems,
            ),
            const SizedBox(height: 24),

            // Log Out Button
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: AppButton(
                  content: 'Log Out',
                  onTap: _showComingSoonDialog,
                  buttonType: ButtonType.secondaryWithTheme,
                  backgroundColor: context.theme.colorScheme.primary,
                  textColor: AppColorPath.white,
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
