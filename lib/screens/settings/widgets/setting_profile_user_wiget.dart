import 'package:crypto_exchange_app/core/constants/app_colors.dart';
import 'package:crypto_exchange_app/core/constants/app_paths.dart';
import 'package:crypto_exchange_app/core/extensions/context_extension.dart';
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
        color: context.theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
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
                      color: context.theme.colorScheme.onSurface,
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
                      color: context.theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(width: 4),
                  InkWell(
                    onTap: () async {
                      Clipboard.setData(const ClipboardData(text: userId))
                          .then((_) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Copied to clipboard!',
                                style: TextStyle(
                                  color: context.surfaceColor,
                                ),
                              ),
                              backgroundColor:
                                  context.theme.colorScheme.surface,
                            ),
                          );
                        }
                      });
                    },
                    child: Icon(
                      Icons.copy,
                      size: 12,
                      color: context.theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            width: (94 / 375) * context.screenWidth,
            height: (36 / 969) * context.screenHeight,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColorPath.verified,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.check_circle,
                  size: 24,
                  color: AppColorPath.iconVerified,
                ),
                const SizedBox(width: 4),
                Text(
                  'Verified',
                  style: AppTextStyle.textFont12W400.copyWith(
                    color: AppColorPath.black,
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
