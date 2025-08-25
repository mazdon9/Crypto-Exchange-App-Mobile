import 'package:crypto_exchange_app/services/storage_service.dart';

class FavoriteRepository {
  /// Stream that emits whenever favorite tokens change
  Stream<List<String>> get favoriteTokensStream =>
      StorageService.instance.favoritesChangeStream;

  List<String> getFavoriteTokens() {
    return StorageService.instance.getFavoriteTokens();
  }

  Future<void> toggleFavoriteToken(String symbol) async {
    await StorageService.instance.toggleFavoriteToken(symbol);
  }
}
