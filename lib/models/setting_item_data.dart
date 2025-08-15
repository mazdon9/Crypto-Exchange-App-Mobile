class SettingItemData {
  final String iconPath;
  final String title;
  final Function() onTap;
  final bool isDarkMode;

  SettingItemData({
    required this.iconPath,
    required this.title,
    required this.onTap,
    this.isDarkMode = false,
  });
}
