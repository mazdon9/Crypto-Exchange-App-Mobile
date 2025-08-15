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
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 8),
          child: AppText(
              title: title,
              style: AppTextStyle.textFont14W400.copyWith(color: Colors.black)),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
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
              return const Padding(
                padding: EdgeInsets.fromLTRB(28, 14, 0, 14),
                child: Divider(
                  thickness: 1,
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
    return Row(
      children: [
        Image.asset(
          items.iconPath,
          width: 24,
          height: 24,
        ),
        const SizedBox(width: 4),
        AppText(
            title: items.title,
            style: AppTextStyle.textFont16W400.copyWith(color: Colors.black)),
        const Spacer(),
        if (items.isDarkMode) ...[
          const AppText(title: 'Dark Mode'),
          const SizedBox(width: 14),
          Switch(
            padding: EdgeInsets.zero,
            value: context.watch<ThemeProvider>().isDarkMode,
            onChanged: (value) {
              context.read<ThemeProvider>().toggleTheme();
            },
          ),
        ] else
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_forward_ios),
          ),
        const SizedBox(width: 14),
      ],
    );
  }
}
