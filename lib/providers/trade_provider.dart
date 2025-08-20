import 'package:crypto_exchange_app/models/orderbook.dart';
import 'package:crypto_exchange_app/repositories/orderbook_repository.dart';
import 'package:flutter/foundation.dart';

class TradeProvider with ChangeNotifier {
  final OrderbookRepository orderbookRepository;

  TradeProvider(this.orderbookRepository) {
    init();
  }

  // loading state
  bool _loading = false;
  bool get loading => _loading;

  // error state
  String? _error;
  String? get error => _error;

  // list asks and bids
  List<OrderbookEntry> _asks = [];
  List<OrderbookEntry> _bids = [];

  List<OrderbookEntry> get asks => _asks;
  List<OrderbookEntry> get bids => _bids;

  final String _currentSymbol = 'btcusdt';
  String get currentSymbol => _currentSymbol;

  Future<void> init() async {
    try {
      _setLoading(true);

      /// Connect to orderbook repository
      await connectToOrderbook(_currentSymbol);
    } catch (e) {
      _setError(e.toString());
      debugPrint("Failed to init home provider: $e");
    } finally {
      _setLoading(false);
    }
  }

  Future<void> connectToOrderbook(String symbol) async {
    try {
      _setLoading(true);
      await orderbookRepository.connectToOrderbook(symbol: _currentSymbol);
      orderbookRepository.orderbookStream.listen((message) {
        _asks = message.asks.take(10).toList();
        _bids = message.bids.take(10).toList();
        notifyListeners();
      });
    } catch (e) {
      _setError(e.toString());
      debugPrint("Failed to connect to orderbook: $e");
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
