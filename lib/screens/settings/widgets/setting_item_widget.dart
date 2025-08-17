import 'package:crypto_exchange_app/core/constants/app_colors.dart';
import 'package:crypto_exchange_app/models/setting_item_data.dart';
import 'package:crypto_exchange_app/providers/theme_provider.dart';
import 'package:crypto_exchange_app/shared/app_text.dart';
import 'package:crypto_exchange_app/shared/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingItemWidget extends StatelessWidget {
  final String title;
  final List<SettingItemData> items;

  const SettingItemWidget({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 8),
          child: AppText(
              title: title,
              style: AppTextStyle.textFont14W400.copyWith(
                color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
              )),
        ),
        Container(
          decoration: BoxDecoration(
            color: isDarkMode ? AppColorPath.darkLight : AppColorPath.white,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.fromLTRB(12, 16, 0, 16),
          child: ListView.separated(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return _buildSettingItemWidget(context, items: items[index]);
            },
            separatorBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(28, 14, 0, 14),
                child: Divider(
                  thickness: 1,
                  color: isDarkMode ? Colors.grey[700] : Colors.grey[300],
                ),
              );
            },
            itemCount: items.length,
          ),
        ),
      ],
    );
  }

  Row _buildSettingItemWidget(BuildContext context,
      {required SettingItemData items}) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Row(
      children: [
        Image.asset(
          items.iconPath,
          width: 24,
          height: 24,
          color: isDarkMode ? Colors.white : null,
        ),
        const SizedBox(width: 4),
        AppText(
            title: items.title,
            style: AppTextStyle.textFont16W400.copyWith(
              color: isDarkMode ? AppColorPath.white : AppColorPath.black,
            )),
        const Spacer(),
        if (items.isDarkMode) ...[
          AppText(
            title: 'Dark mode',
            style: AppTextStyle.textFont14W400.copyWith(
              color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
            ),
          ),
          const SizedBox(width: 14),
          Switch(
            padding: EdgeInsets.zero,
            value: context.watch<ThemeProvider>().isDarkMode,
            activeColor: AppColorPath.blue,
            onChanged: (value) {
              context.read<ThemeProvider>().toggleTheme();
            },
          ),
        ] else
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_forward_ios,
              color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
              size: 16,
            ),
          ),
        const SizedBox(width: 14),
      ],
    );
  }
}
