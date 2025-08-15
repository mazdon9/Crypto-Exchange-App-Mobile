import 'package:crypto_exchange_app/core/constants/app_colors.dart';
import 'package:crypto_exchange_app/core/constants/app_paths.dart';
import 'package:crypto_exchange_app/shared/app_button.dart';
import 'package:crypto_exchange_app/shared/app_text_style.dart';
import 'package:crypto_exchange_app/widgets/setting_item_widget.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isDarkMode = false;

  void _showComingSoonDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Coming Soon'),
        content: const Text('Opps! This feature will be updated later...'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorPath.lightWhite,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Settings',
          style: AppTextStyle.textFont16W400.copyWith(
            color: AppColorPath.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
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
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColorPath.black.withOpacity(0.1),
                ),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage(AppPaths.avatarImages),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dmitro',
                          style: AppTextStyle.textFont16W400.copyWith(
                            color: AppColorPath.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'jo***@***com',
                          style: AppTextStyle.textFont14W400.copyWith(
                            color: AppColorPath.black.withAlpha(60),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              'ID 2895474',
                              style: AppTextStyle.textFont12W400.copyWith(
                                color: AppColorPath.black.withAlpha(60),
                              ),
                            ),
                            const SizedBox(width: 4),
                            Icon(
                              Icons.copy,
                              size: 12,
                              color: AppColorPath.black.withAlpha(60),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.check_circle,
                          size: 12,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Verified',
                          style: AppTextStyle.textFont12W400.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Privacy Section
            Text(
              'Privacy',
              style: AppTextStyle.textFont14W400.copyWith(
                color: AppColorPath.black.withAlpha(60),
              ),
            ),
            const SizedBox(height: 12),
            SettingItemWidget(
              iconPath: AppPaths.profileIcon,
              title: 'Profile',
              onTap: _showComingSoonDialog,
            ),
            const SizedBox(height: 8),
            SettingItemWidget(
              iconPath: AppPaths.securityIcon,
              title: 'Security',
              onTap: _showComingSoonDialog,
            ),
            const SizedBox(height: 24),

            // Finance Section
            Text(
              'Finance',
              style: AppTextStyle.textFont14W400.copyWith(
                color: AppColorPath.black.withAlpha(60),
              ),
            ),
            const SizedBox(height: 12),
            SettingItemWidget(
              iconPath: AppPaths.historyIcon,
              title: 'History',
              onTap: _showComingSoonDialog,
            ),
            const SizedBox(height: 8),
            SettingItemWidget(
              iconPath: AppPaths.limitsIcon,
              title: 'Limits',
              onTap: _showComingSoonDialog,
            ),
            const SizedBox(height: 24),

            // Account Section
            Text(
              'Account',
              style: AppTextStyle.textFont14W400.copyWith(
                color: AppColorPath.black.withAlpha(60),
              ),
            ),
            const SizedBox(height: 12),
            SettingItemWidget(
              iconPath: AppPaths.themesIcon,
              title: 'Theme',
              hasArrow: false,
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Dark mode',
                    style: AppTextStyle.textFont14W400.copyWith(
                      color: AppColorPath.black.withAlpha(60),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Switch(
                    value: isDarkMode,
                    onChanged: (value) {
                      setState(() {
                        isDarkMode = value;
                      });
                    },
                    activeColor: AppColorPath.blue,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            SettingItemWidget(
              iconPath: AppPaths.bellIcon,
              title: 'Notifications',
              onTap: _showComingSoonDialog,
            ),
            const SizedBox(height: 24),

            // More Section
            Text(
              'More',
              style: AppTextStyle.textFont14W400.copyWith(
                color: AppColorPath.black.withAlpha(60),
              ),
            ),
            const SizedBox(height: 12),
            SettingItemWidget(
              iconPath: AppPaths.giftIcon,
              title: 'My bonus',
              onTap: _showComingSoonDialog,
            ),
            const SizedBox(height: 8),
            SettingItemWidget(
              iconPath: AppPaths.sharePlusIcon,
              title: 'Share with friends',
              onTap: _showComingSoonDialog,
            ),
            const SizedBox(height: 8),
            SettingItemWidget(
              iconPath: AppPaths.supportIcon,
              title: 'Support',
              onTap: _showComingSoonDialog,
            ),
            const SizedBox(height: 32),

            // Log Out Button
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: AppButton(
                content: 'Log Out',
                onTap: _showComingSoonDialog,
                backgroundColor: AppColorPath.blue,
                textColor: AppColorPath.white,
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
