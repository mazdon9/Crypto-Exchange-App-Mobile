import 'package:crypto_exchange_app/core/constants/app_colors.dart';
import 'package:crypto_exchange_app/core/constants/app_paths.dart';
import 'package:crypto_exchange_app/shared/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingProfileUserWiget extends StatelessWidget {
  const SettingProfileUserWiget({super.key});

  @override
  Widget build(BuildContext context) {
    const userId = "2895474";
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColorPath.black.withOpacity(0.1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage(AppPaths.avatarImages),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Dmitro \njo***@***com',
                    style: AppTextStyle.textFont16W400.copyWith(
                      color: AppColorPath.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    'ID $userId',
                    style: AppTextStyle.textFont12W400.copyWith(
                      color: AppColorPath.black.withAlpha(60),
                    ),
                  ),
                  const SizedBox(width: 4),
                  InkWell(
                    onTap: () async {
                      Clipboard.setData(ClipboardData(text: userId)).then((_) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Copied to clipboard!')),
                          );
                        }
                      });
                    },
                    child: Icon(
                      Icons.copy,
                      size: 12,
                      color: AppColorPath.black.withAlpha(60),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.check_circle,
                  size: 24,
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
    );
  }
}
