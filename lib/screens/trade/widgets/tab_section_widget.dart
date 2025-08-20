import 'package:crypto_exchange_app/core/constants/app_colors.dart';
import 'package:crypto_exchange_app/core/extensions/context_extension.dart';
import 'package:crypto_exchange_app/shared/app_text_style.dart';
import 'package:flutter/material.dart';

class TabSectionWidget extends StatelessWidget {
  final List<String> tabs;
  final int selectedTabIndex;
  final Function(int) onTabSelected;

  const TabSectionWidget({
    super.key,
    required this.tabs,
    required this.selectedTabIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.theme.brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: isDarkMode ? AppColorPath.darkLight : AppColorPath.lightWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: tabs.asMap().entries.map((entry) {
          int index = entry.key;
          String tab = entry.value;
          bool isSelected = selectedTabIndex == index;

          return Expanded(
            child: GestureDetector(
              onTap: () => onTabSelected(index),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected
                      ? (isDarkMode ? AppColorPath.blue : AppColorPath.white)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Text(
                    tab,
                    style: AppTextStyle.textFont14W400.copyWith(
                      color: isSelected
                          ? (isDarkMode
                              ? AppColorPath.white
                              : AppColorPath.black)
                          : (isDarkMode
                              ? AppColorPath.white
                              : AppColorPath.textSecondary),
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
