import 'package:crypto_exchange_app/models/ticker.dart';
import 'package:crypto_exchange_app/repositories/favorite_repository.dart';
import 'package:crypto_exchange_app/repositories/ticker_repository.dart';
import 'package:flutter/material.dart';

class FavoriteProvider with ChangeNotifier {
  /// Kiểm tra một coin có đang được favorite không
  bool isFavorite(String symbol) {
    return _favoriteTokens.contains(symbol.toLowerCase());
  }

  FavoriteRepository favoriteRepository;
  TickerRepository tickerRepository;

  FavoriteProvider(this.favoriteRepository, this.tickerRepository) {
    init();
  }

  List<Ticker> _favorites = [];

  List<Ticker> get favorites => List.unmodifiable(_favorites);

  List<String> _favoriteTokens = [];
  Map<String, Ticker> _tempAllCoins = {};

  Future<void> init() async {
    // get favorites coin
    _favoriteTokens = favoriteRepository.getFavoriteTokens();

    /// Listen to favorite coins changes
    favoriteRepository.favoriteTokensStream.listen((favorite) {
      _favoriteTokens = favorite;

      /// update favorites coins
      _updateFavoriteCoins();
      notifyListeners();
    });

    /// Listen to coin update
    tickerRepository.coinUpdates.listen((allCoins) {
      _tempAllCoins = allCoins;

      /// update favorites coins
      _updateFavoriteCoins();
      notifyListeners();
    });
  }

  void _updateFavoriteCoins() {
    // update favorites coins (if coin not in favorites, add it
    _favorites = _tempAllCoins.values
        .where((coin) => _favoriteTokens.contains(coin.symbol.toLowerCase()))
        .toList();
  }

  /// Toggle favorite
  Future<void> toggleFavoriteToken(String symbol) async {
    await favoriteRepository.toggleFavoriteToken(symbol);
    _favoriteTokens = favoriteRepository.getFavoriteTokens();
    _updateFavoriteCoins();
    notifyListeners();
  }
}
