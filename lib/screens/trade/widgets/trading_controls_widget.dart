import 'package:crypto_exchange_app/core/constants/app_colors.dart';
import 'package:crypto_exchange_app/core/enums/button_type.dart';
import 'package:crypto_exchange_app/core/extensions/context_extensions.dart';
import 'package:crypto_exchange_app/screens/trade/widgets/trade_input_box_widget.dart';
import 'package:crypto_exchange_app/shared/app_button.dart';
import 'package:crypto_exchange_app/shared/app_text_style.dart';
import 'package:flutter/material.dart';

class TradingControlsWidget extends StatelessWidget {
  final bool isBuySelected;
  final String selectedLimit;
  final double sliderValue;
  final int usdtAmount;
  final int btcAmount;
  final Function(bool) onBuySellChanged;
  final VoidCallback onLimitTap;
  final Function(double) onSliderChanged;
  final VoidCallback onUsdtIncrease;
  final VoidCallback onUsdtDecrease;
  final VoidCallback onBtcIncrease;
  final VoidCallback onBtcDecrease;
  final VoidCallback onBuyTap;

  const TradingControlsWidget({
    super.key,
    required this.isBuySelected,
    required this.selectedLimit,
    required this.sliderValue,
    required this.usdtAmount,
    required this.btcAmount,
    required this.onBuySellChanged,
    required this.onLimitTap,
    required this.onSliderChanged,
    required this.onUsdtIncrease,
    required this.onUsdtDecrease,
    required this.onBtcIncrease,
    required this.onBtcDecrease,
    required this.onBuyTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Buy/Sell Tab Buttons
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: context.theme.brightness == Brightness.dark
                ? AppColorPath.darkLight
                : AppColorPath.lightWhite,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => onBuySellChanged(true),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: isBuySelected
                          ? AppColorPath.blue
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: Text(
                        'Buy',
                        style: AppTextStyle.textFont14W400.copyWith(
                          color: isBuySelected
                              ? AppColorPath.white
                              : (context.theme.brightness == Brightness.dark
                                  ? AppColorPath.white
                                  : AppColorPath.textSecondary),
                          fontWeight:
                              isBuySelected ? FontWeight.w600 : FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => onBuySellChanged(false),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: !isBuySelected ? Colors.red : Colors.transparent,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: Text(
                        'Sell',
                        style: AppTextStyle.textFont14W400.copyWith(
                          color: !isBuySelected
                              ? AppColorPath.white
                              : (context.theme.brightness == Brightness.dark
                                  ? AppColorPath.white
                                  : AppColorPath.textSecondary),
                          fontWeight: !isBuySelected
                              ? FontWeight.w600
                              : FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Limit Dropdown
        GestureDetector(
          onTap: onLimitTap,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(
                  color: context.theme.colorScheme.outline.withAlpha(10)),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedLimit,
                  style: context.theme.textTheme.bodyMedium,
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  size: 16,
                  color: context.theme.colorScheme.onSurface,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Available Text
        Column(
          children: [
            Text(
              'Available: ',
              style: context.theme.textTheme.bodyMedium,
            ),
            Text(
              '1000 USDT',
              style: context.theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Amount Input Boxes
        TradeInputBoxWidget(
          value: '30,113.80',
          currency: 'USDT',
          onIncrease: onUsdtIncrease,
          onDecrease: onUsdtDecrease,
        ),
        const SizedBox(height: 8),
        TradeInputBoxWidget(
          value: '0.04014',
          currency: 'BTC',
          onIncrease: onBtcIncrease,
          onDecrease: onBtcDecrease,
        ),
        const SizedBox(height: 16),

        // Percentage Text
        Text(
          '100%',
          style: context.theme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 8),

        // Slider
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: AppColorPath.blue,
            inactiveTrackColor: AppColorPath.textSecondary.withAlpha(100),
            thumbColor: AppColorPath.blue,
            overlayColor: AppColorPath.blue.withAlpha(50),
            trackHeight: 2,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
          ),
          child: Slider(
            value: sliderValue,
            onChanged: onSliderChanged,
            divisions: 4,
          ),
        ),
        const SizedBox(height: 8),

        // Slider Labels
        Container(
          padding: const EdgeInsets.all(8),
          height: (32 / 815) * context.screenHeight,
          decoration: BoxDecoration(
            color: context.theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: context.theme.brightness == Brightness.dark
                    ? Colors.black.withAlpha(50)
                    : Colors.grey.withAlpha(30),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
            border: Border.all(
              color: context.theme.colorScheme.outline.withAlpha(10),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('1000', style: context.theme.textTheme.bodySmall),
              Text('USDT', style: context.theme.textTheme.bodySmall),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Buy BTC Button
        AppButton(
          content: 'Buy BTC',
          onTap: onBuyTap,
          buttonType: ButtonType.defaultNoTheme,
        ),
      ],
    );
  }
}
