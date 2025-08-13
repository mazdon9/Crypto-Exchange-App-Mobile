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
  List<Ticker> get tickerList => _tickerList;

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
