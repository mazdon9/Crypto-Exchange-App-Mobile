import 'package:crypto_exchange_app/models/orderbook.dart';
import 'package:crypto_exchange_app/services/binance_websocket_service.dart';

class OrderbookRepository {
  final BinanceWebsocketService binanceWebsocketService;

  OrderbookRepository(this.binanceWebsocketService);

  // Stream orderbook data
  Stream<Orderbook> get orderbookStream =>
      binanceWebsocketService.orderbookStream;

  // Connect to orderbook
  Future<void> connectToOrderbook({required String symbol}) async {
    await binanceWebsocketService.connectToOrderbook(symbol: symbol);
  }

  // Dispose orderbook
  Future<void> disposeOrderbook() async {
    await binanceWebsocketService.disposeOrderbook();
  }
}
