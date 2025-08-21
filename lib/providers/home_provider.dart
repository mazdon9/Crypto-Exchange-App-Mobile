import 'package:crypto_exchange_app/core/constants/app_data.dart';
import 'package:crypto_exchange_app/models/ticker.dart';
import 'package:crypto_exchange_app/repositories/ticker_repository.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  final TickerRepository tickerRepository;

  HomeProvider(this.tickerRepository) {
    init();
  }

  // loading state
  bool _loading = false;
  bool get loading => _loading;

  // error state
  String? _error;
  String? get error => _error;

  // list of ticker
  List<Ticker> _tickerList = [];
  // Chỉ trả về đúng 20 đồng coin theo AppData.coins, đúng thứ tự
  List<Ticker> get tickerList {
    final coinOrder = AppData.coins;
    final tickerMap = {for (var t in _tickerList) t.symbol.toLowerCase(): t};
    // Định dạng lại lastPrice cho từng ticker
    List<Ticker> result = [];
    for (final c in coinOrder) {
      final t = tickerMap[c];
      if (t != null) {
        String formattedPrice = t.lastPrice;
        double? priceNum = double.tryParse(t.lastPrice);
        if (priceNum != null) {
          // Format phần nguyên với dấu cách mỗi 3 số
          List<String> parts = priceNum.toStringAsFixed(2).split('.');
          String intPart = parts[0].replaceAllMapped(
            RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
            (Match m) => '${m[1]} ',
          );
          formattedPrice = '$intPart.${parts[1]}';
        }
        result.add(Ticker(
          symbol: t.symbol,
          lastPrice: formattedPrice,
          priceChangePercent: t.priceChangePercent,
          volume: t.volume,
        ));
      }
    }
    return result;
  }

  // init home provider -> connect to ticker repository then listen to websocket
  Future<void> init() async {
    try {
      _setLoading(true);

      /// Connect to ticker repository
      await tickerRepository.connectToTickers(coins: AppData.coins);

      /// Listen to ticker repository
      tickerRepository.coinUpdates.listen(
        (message) {
          _tickerList = message.values.toList();
          debugPrint(
              "Ticker repository updated with length ${_tickerList.length}");
          notifyListeners();
        },
        onError: (error) {
          _setError(error.toString());
        },
        onDone: () {
          debugPrint("Ticker repository done");
        },
      );
    } catch (e) {
      _setError(e.toString());
      debugPrint("Failed to init home provider: $e");
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void _setError(String? value) {
    _error = value;
    notifyListeners();
  }
}
