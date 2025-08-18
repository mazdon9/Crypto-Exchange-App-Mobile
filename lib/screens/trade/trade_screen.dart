import 'package:crypto_exchange_app/core/constants/app_colors.dart';
import 'package:crypto_exchange_app/core/enums/button_type.dart';
import 'package:crypto_exchange_app/core/extensions/context_extensions.dart';
import 'package:crypto_exchange_app/screens/trade/widgets/trade_input_box_widget.dart';
import 'package:crypto_exchange_app/shared/app_button.dart';
import 'package:crypto_exchange_app/shared/app_text_style.dart';
import 'package:flutter/material.dart';

class TradeScreen extends StatefulWidget {
  const TradeScreen({super.key});

  @override
  State<TradeScreen> createState() => _TradeScreenState();
}

class _TradeScreenState extends State<TradeScreen> {
  int _selectedTabIndex = 0;
  String _selectedPair = 'BTC/USDT';
  String _selectedOrderType = '10';
  String _selectedUnit = '0.00001';
  bool _isBuySelected = true;
  String _selectedLimit = 'Limit';
  double _sliderValue = 0.0;
  int _usdtAmount = 0;
  int _btcAmount = 0;

  final List<String> _tabs = ['Spot', 'Margin', 'Grid', 'Fiat'];
  final List<String> _tradingPairs = [
    'BTC/USDT',
    'ETH/USDT',
    'BNB/USDT',
    'ADA/USDT',
    'XRP/USDT',
    'SOL/USDT',
    'DOT/USDT',
    'DOGE/USDT',
    'AVAX/USDT',
    'MATIC/USDT',
    'LINK/USDT',
    'UNI/USDT',
    'LTC/USDT',
    'BCH/USDT',
    'XLM/USDT',
    'VET/USDT',
    'ICP/USDT',
    'FIL/USDT',
    'TRX/USDT',
    'ETC/USDT'
  ];
  final List<String> _orderTypes = ['5', '10', '25', '50', '100'];
  final List<String> _units = ['0.00001', '0.0001', '0.001', '0.01', '0.1'];
  final List<String> _limitTypes = ['Limit', 'Market', 'Stop Limit'];

  void _showPairBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: context.theme.colorScheme.surface,
      builder: (context) => Container(
        height: 400,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Trading Pair',
              style: context.theme.textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _tradingPairs.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      _tradingPairs[index],
                      style: context.theme.textTheme.bodyLarge,
                    ),
                    onTap: () {
                      setState(() {
                        _selectedPair = _tradingPairs[index];
                      });
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showOrderTypeBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: context.theme.colorScheme.surface,
      builder: (context) => Container(
        height: 300,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Order Type',
              style: context.theme.textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _orderTypes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      _orderTypes[index],
                      style: context.theme.textTheme.bodyLarge,
                    ),
                    onTap: () {
                      setState(() {
                        _selectedOrderType = _orderTypes[index];
                      });
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showUnitBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: context.theme.colorScheme.surface,
      builder: (context) => Container(
        height: 300,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Unit',
              style: context.theme.textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _units.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      _units[index],
                      style: context.theme.textTheme.bodyLarge,
                    ),
                    onTap: () {
                      setState(() {
                        _selectedUnit = _units[index];
                      });
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLimitBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: context.theme.colorScheme.surface,
      builder: (context) => Container(
        height: 200,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Limit Type',
              style: context.theme.textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _limitTypes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      _limitTypes[index],
                      style: context.theme.textTheme.bodyLarge,
                    ),
                    onTap: () {
                      setState(() {
                        _selectedLimit = _limitTypes[index];
                      });
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToMarket() {
    // Navigate to market screen - will implement with router later
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Navigate to Market Screen',
          style: TextStyle(color: context.theme.colorScheme.onSurface),
        ),
        backgroundColor: context.theme.colorScheme.surface,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.theme.brightness == Brightness.dark;

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
          'Trade',
          style: context.theme.textTheme.bodyLarge?.copyWith(
            color: isDarkMode ? AppColorPath.white : AppColorPath.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.equalizer,
              color: context.theme.colorScheme.onSurface,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // 2. Tab Section
          _buildTabSection(),
          const SizedBox(height: 16),

          // 3. Trading Pair Row
          _buildTradingPairRow(),
          const SizedBox(height: 16),

          // 4. Price Info Row
          _buildPriceInfoRow(),
          const SizedBox(height: 16),

          // 5. Main Trading Section - Expanded to fill remaining space
          Expanded(
            child: _buildMainTradingSection(),
          ),
          const SizedBox(height: 16),

          // 6. Open Orders Row
          _buildOpenOrdersRow(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildTabSection() {
    final isDarkMode = context.theme.brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: isDarkMode ? AppColorPath.darkLight : AppColorPath.lightWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: _tabs.asMap().entries.map((entry) {
          int index = entry.key;
          String tab = entry.value;
          bool isSelected = _selectedTabIndex == index;

          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedTabIndex = index;
                });
              },
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

  Widget _buildTradingPairRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: _showPairBottomSheet,
              child: Row(
                children: [
                  Text(
                    _selectedPair,
                    style: context.theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: context.theme.colorScheme.onSurface,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: _navigateToMarket,
            child: Icon(
              Icons.equalizer,
              color: context.theme.colorScheme.onSurface,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceInfoRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Flexible(
            child: Text(
              '30,113.80',
              style: AppTextStyle.textFont16W500.copyWith(
                color: Colors.green,
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 4),
          Flexible(
            child: Text(
              '≈\$30,113.80',
              style: AppTextStyle.textFont14W400.copyWith(
                color: AppColorPath.textSecondary,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            '+2.76%',
            style: AppTextStyle.textFont14W400.copyWith(
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainTradingSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left Column
          SizedBox(
            width: (145 / 375) * context.screenWidth,
            child: _buildLeftColumn(),
          ),
          const SizedBox(width: 12),
          // Right Column
          Expanded(
            child: _buildRightColumn(),
          ),
        ],
      ),
    );
  }

  Widget _buildLeftColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Order Bk No. and Unit Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                'Order Bk No.',
                style: context.theme.textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Flexible(
              child: Text(
                'Unit',
                style: context.theme.textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),

        // Dropdown Row
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: _showOrderTypeBottomSheet,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: context.theme.colorScheme.outline),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      Text(
                        _selectedOrderType,
                        style: context.theme.textTheme.bodyMedium,
                      ),
                      const Spacer(),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 16,
                        color: context.theme.colorScheme.onSurface,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: GestureDetector(
                onTap: _showUnitBottomSheet,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: context.theme.colorScheme.outline),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      Text(
                        _selectedUnit,
                        style: context.theme.textTheme.bodyMedium,
                      ),
                      const Spacer(),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 16,
                        color: context.theme.colorScheme.onSurface,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Price and Amount Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                'Price',
                style: context.theme.textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Flexible(
              child: Text(
                'Amount',
                style: context.theme.textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),

        // Order Book Data
        _buildOrderBookData(),
      ],
    );
  }

  Widget _buildOrderBookData() {
    // Sample order book data
    final orderBookData = [
      {'price': '30,113.84', 'amount': '1.76676', 'color': Colors.red},
      {'price': '30,114.84', 'amount': '2.20046', 'color': Colors.red},
      {'price': '30,113.97', 'amount': '9.25520', 'color': Colors.red},
      {'price': '30,113.87', 'amount': '6.98039', 'color': Colors.red},
      {'price': '30,114.71', 'amount': '6.14111', 'color': Colors.red},
      {'price': '30,114.22', 'amount': '2.21189', 'color': Colors.red},
      {'price': '30,114.41', 'amount': '3.00018', 'color': Colors.red},
      {'price': '30,114.36', 'amount': '9.92881', 'color': Colors.red},
      {'price': '30,113.99', 'amount': '1.18708', 'color': Colors.red},
      {'price': '30,113.88', 'amount': '4.49994', 'color': Colors.red},
      {'price': '30,113.79', 'amount': '9.70443', 'color': Colors.green},
      {'price': '30,113.70', 'amount': '6.29631', 'color': Colors.green},
      {'price': '30,113.66', 'amount': '6.28200', 'color': Colors.green},
      {'price': '30,112.45', 'amount': '2.18599', 'color': Colors.green},
      {'price': '30,112.95', 'amount': '2.74875', 'color': Colors.green},
      {'price': '30,113.55', 'amount': '7.14350', 'color': Colors.green},
      {'price': '30,113.75', 'amount': '1.05598', 'color': Colors.green},
      {'price': '30,113.66', 'amount': '9.43509', 'color': Colors.green},
      {'price': '30,113.80', 'amount': '1.16627', 'color': Colors.green},
      {'price': '30,113.80', 'amount': '2.93046', 'color': Colors.green},
    ];

    return Expanded(
      child: ListView.builder(
        itemCount: orderBookData.length,
        itemBuilder: (context, index) {
          final data = orderBookData[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    data['price'] as String,
                    style: AppTextStyle.textFont12W400.copyWith(
                      color: data['color'] as Color,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Expanded(
                  child: Text(
                    data['amount'] as String,
                    style: AppTextStyle.textFont12W400.copyWith(
                      color: context.theme.textTheme.bodyMedium?.color,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildRightColumn() {
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
                  onTap: () {
                    setState(() {
                      _isBuySelected = true;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: _isBuySelected
                          ? AppColorPath.blue
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: Text(
                        'Buy',
                        style: AppTextStyle.textFont14W400.copyWith(
                          color: _isBuySelected
                              ? AppColorPath.white
                              : (context.theme.brightness == Brightness.dark
                                  ? AppColorPath.white
                                  : AppColorPath.textSecondary),
                          fontWeight: _isBuySelected
                              ? FontWeight.w600
                              : FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isBuySelected = false;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: !_isBuySelected ? Colors.red : Colors.transparent,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: Text(
                        'Sell',
                        style: AppTextStyle.textFont14W400.copyWith(
                          color: !_isBuySelected
                              ? AppColorPath.white
                              : (context.theme.brightness == Brightness.dark
                                  ? AppColorPath.white
                                  : AppColorPath.textSecondary),
                          fontWeight: !_isBuySelected
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
          onTap: _showLimitBottomSheet,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(
                  color: context.theme.colorScheme.outline.withAlpha(10)),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Text(
                  _selectedLimit,
                  style: context.theme.textTheme.bodyMedium,
                ),
                const Spacer(),
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
          onIncrease: () {
            setState(() {
              _usdtAmount++;
            });
          },
          onDecrease: () {
            setState(() {
              if (_usdtAmount > 0) _usdtAmount--;
            });
          },
        ),
        const SizedBox(height: 8),
        TradeInputBoxWidget(
          value: '0.04014',
          currency: 'BTC',
          onIncrease: () {
            setState(() {
              _btcAmount++;
            });
          },
          onDecrease: () {
            setState(() {
              if (_btcAmount > 0) _btcAmount--;
            });
          },
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
            value: _sliderValue,
            onChanged: (value) {
              setState(() {
                _sliderValue = value;
              });
            },
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

        // Spacer to push Buy button to bottom

        // Buy BTC Button
        AppButton(
          content: 'Buy BTC',
          onTap: () {},
          buttonType: ButtonType.defaultWithTheme,
        ),
      ],
    );
  }

  Row _buildOpenOrdersRow() {
    return Row(
      children: [
        const SizedBox(width: 16),
        Text(
          'Open Orders',
          style: context.theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            // Show coming soon dialog or navigate
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Coming Soon',
                  style: TextStyle(color: context.theme.colorScheme.onSurface),
                ),
                backgroundColor: context.theme.colorScheme.surface,
              ),
            );
          },
          child: Text(
            'More',
            style: AppTextStyle.textFont14W400.copyWith(
              color: AppColorPath.blue,
            ),
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
