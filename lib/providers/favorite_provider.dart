import 'package:crypto_exchange_app/models/ticker.dart';
import 'package:flutter/material.dart';

class FavoriteProvider with ChangeNotifier {
  final List<Ticker> _favorites = [];

  List<Ticker> get favorites => List.unmodifiable(_favorites);

  void addFavorite(Ticker ticker) {
    if (!_favorites.any((t) => t.symbol == ticker.symbol)) {
      _favorites.add(ticker);
      notifyListeners();
    }
  }

  void removeFavorite(String symbol) {
    _favorites.removeWhere((t) => t.symbol == symbol);
    notifyListeners();
  }
}
