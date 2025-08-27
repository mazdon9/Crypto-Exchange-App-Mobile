import 'package:crypto_exchange_app/core/constants/app_colors.dart';
import 'package:crypto_exchange_app/core/extensions/context_extension.dart';
import 'package:crypto_exchange_app/core/router/app_router.dart';
import 'package:crypto_exchange_app/models/ticker.dart';
import 'package:crypto_exchange_app/providers/favorite_provider.dart';
import 'package:crypto_exchange_app/providers/home_provider.dart';
import 'package:crypto_exchange_app/providers/trade_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/widgets.dart';

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
    // 'MATIC/USDT',
    'LINK/USDT',
    'UNI/USDT',
    'LTC/USDT',
    // 'BCH/USDT',
    'XLM/USDT',
    'VET/USDT',
    'ICP/USDT',
    'FIL/USDT',
    'TRX/USDT',
    // 'ETC/USDT'
  ];
  final List<String> _orderTypes = ['5', '10', '25', '50', '100'];
  final List<String> _units = ['0.00001', '0.0001', '0.001', '0.01', '0.1'];
  final List<String> _limitTypes = ['Limit', 'Market', 'Stop Limit'];

  void _showPairBottomSheet() {
    SelectionBottomSheet.show(
      context: context,
      title: 'Select Trading Pair',
      items: _tradingPairs,
      selectedItem: _selectedPair,
      onItemSelected: (value) {
        setState(() {
          _selectedPair = value;
        });
        context.read<TradeProvider>().connectToOrderbook(
            _selectedPair.replaceAll('/', '').toLowerCase());
      },
    );
  }

  void _showOrderTypeBottomSheet() {
    SelectionBottomSheet.show(
      context: context,
      title: 'Select Order Type',
      items: _orderTypes,
      selectedItem: _selectedOrderType,
      onItemSelected: (value) {
        setState(() {
          _selectedOrderType = value;
        });
      },
    );
  }

  void _showUnitBottomSheet() {
    SelectionBottomSheet.show(
      context: context,
      title: 'Select Unit',
      items: _units,
      selectedItem: _selectedUnit,
      onItemSelected: (value) {
        setState(() {
          _selectedUnit = value;
        });
      },
    );
  }

  void _showLimitBottomSheet() {
    SelectionBottomSheet.show(
      context: context,
      title: 'Select Limit Type',
      items: _limitTypes,
      selectedItem: _selectedLimit,
      onItemSelected: (value) {
        setState(() {
          _selectedLimit = value;
        });
      },
    );
  }

  void _showComingSoonSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Coming Soon',
          style: TextStyle(color: context.theme.colorScheme.onSurface),
        ),
        backgroundColor: context.theme.colorScheme.surface,
      ),
    );
  }

  void _navigateToMarket() {
    Navigator.pushNamed(context, AppRoutes.tradingScreen);
  }

  @override
  void initState() {
    debugPrint("Init state");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.theme.brightness == Brightness.dark;
    debugPrint("Init again");

    return Consumer2<HomeProvider, FavoriteProvider>(
      builder: (context, homeProvider, favoriteProvider, child) {
        final selectedSymbol = _selectedPair.replaceAll('/', '').toUpperCase();
        final selectedTicker = homeProvider.tickerList.firstWhere(
          (t) => t.symbol.toUpperCase() == selectedSymbol,
          orElse: () => Ticker(
              symbol: '--',
              priceChangePercent: '0',
              lastPrice: '--',
              volume: '0'),
        );
        final price = selectedTicker.lastPrice;
        final dollarPrice = selectedTicker.lastPrice != '--'
            ? '≈\$${double.tryParse(selectedTicker.lastPrice)?.toStringAsFixed(4) ?? selectedTicker.lastPrice}'
            : '≈\$--';
        final percentage =
            '${selectedTicker.priceChangePercent.startsWith('-') ? '' : '+'}${selectedTicker.priceChangePercent}%';
        final isFavorite =
            favoriteProvider.isFavorite(selectedSymbol.toLowerCase());

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
                  Icons.star,
                  color: isFavorite ? Colors.amber : Colors.grey,
                  size: 28,
                ),
                onPressed: () {
                  context
                      .read<FavoriteProvider>()
                      .toggleFavoriteToken(selectedSymbol.toLowerCase());
                },
              ),
            ],
          ),
          body: Column(
            children: [
              // Tab Section
              TabSectionWidget(
                tabs: _tabs,
                selectedTabIndex: _selectedTabIndex,
                onTabSelected: (index) {
                  setState(() {
                    _selectedTabIndex = index;
                  });
                },
              ),
              const SizedBox(height: 16),

              // Trading Pair Row
              TradingPairRowWidget(
                selectedPair: _selectedPair,
                onPairTap: _showPairBottomSheet,
                onMarketTap: _navigateToMarket,
              ),

              // Price Info Row
              PriceInfoRowWidget(
                price: price,
                dollarPrice: dollarPrice,
                percentage: percentage,
              ),
              const SizedBox(height: 16),

              // Main Trading Section
              Expanded(
                child: _buildMainTradingSection(),
              ),
              const SizedBox(height: 16),

              // Open Orders Row
              OpenOrdersRowWidget(
                onMoreTap: _showComingSoonSnackbar,
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  Padding _buildMainTradingSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left Column - Order Book
          SizedBox(
            width: (145 / 375) * context.screenWidth,
            child: OrderBookWidget(
              selectedOrderType: _selectedOrderType,
              selectedUnit: _selectedUnit,
              onOrderTypeTap: _showOrderTypeBottomSheet,
              onUnitTap: _showUnitBottomSheet,
            ),
          ),
          const SizedBox(width: 12),
          // Right Column - Trading Controls
          // Expanded(
          //   child: TradingControlsWidget(
          //     isBuySelected: _isBuySelected,
          //     selectedLimit: _selectedLimit,
          //     sliderValue: _sliderValue,
          //     usdtAmount: _usdtAmount,
          //     btcAmount: _btcAmount,
          //     onBuySellChanged: (isBuy) {
          //       setState(() {
          //         _isBuySelected = isBuy;
          //       });
          //     },
          //     onLimitTap: _showLimitBottomSheet,
          //     onSliderChanged: (value) {
          //       setState(() {
          //         _sliderValue = value;
          //       });
          //     },
          //     onUsdtIncrease: () {
          //       setState(() {
          //         _usdtAmount++;
          //       });
          //     },
          //     onUsdtDecrease: () {
          //       setState(() {
          //         if (_usdtAmount > 0) _usdtAmount--;
          //       });
          //     },
          //     onBtcIncrease: () {
          //       setState(() {
          //         _btcAmount++;
          //       });
          //     },
          //     onBtcDecrease: () {
          //       setState(() {
          //         if (_btcAmount > 0) _btcAmount--;
          //       });
          //     },
          //     onBuyTap: () {
          //       // Implement buy functionality
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
