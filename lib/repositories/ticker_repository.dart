import 'package:crypto_exchange_app/models/ticker.dart';
import 'package:crypto_exchange_app/services/binance_websocket_service.dart';

class TickerRepository {
  final BinanceWebsocketService binanceWebsocketService;

  TickerRepository(this.binanceWebsocketService);

  // Stream of ticker - coin data updates
  Stream<Map<String, Ticker>> get coinUpdates =>
      binanceWebsocketService.tickerStream;

  // Connect to ticker
  Future<void> connectToTickers({required List<String> coins}) async {
    await binanceWebsocketService.connectToTickers(coins: coins);
  }

  // Dispose ticker
  Future<void> disposeTicker() async {
    await binanceWebsocketService.disposeTicker();
  }
}
