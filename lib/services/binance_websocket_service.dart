import 'dart:async';
import 'dart:convert';

import 'package:crypto_exchange_app/models/orderbook.dart';
import 'package:crypto_exchange_app/models/ticker.dart';
import 'package:flutter/cupertino.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class BinanceWebsocketService {
  BinanceWebsocketService();

  /// Ticker - Coin
  static const String _baseTickerUrl =
      'wss://stream.binance.com:9443/stream?streams=';

  /// StreamController for coin data
  final StreamController<Map<String, Ticker>> _tickerStreamController =
      StreamController<Map<String, Ticker>>.broadcast();

  /// Stream for coin data to listen
  Stream<Map<String, Ticker>> get tickerStream =>
      _tickerStreamController.stream;

  /// Map of coin data
  final Map<String, Ticker> _tickerMap = {};

  /// Websocket channel
  WebSocketChannel? _tickerChannel;

  /// Connect to tickers
  Future<void> connectToTickers({required List<String> coins}) async {
    try {
      /// create stream parametere for all coins
      final stream =
          coins.map((coin) => '${coin.toLowerCase()}@ticker').join('/');

      /// final url
      final url = '$_baseTickerUrl$stream';

      /// Create websocket channel
      _tickerChannel = WebSocketChannel.connect(Uri.parse(url));

      /// Listen to websocket channel
      if (_tickerChannel == null) return;

      _tickerChannel?.stream.listen((message) {
        /// decode json (from string to json)
        final jsonData = jsonDecode(message);

        /// get data from json
        final data = jsonData['data'];

        if (data == null) return;

        /// Map json data to Ticker object
        final ticker = Ticker.fromJson(data);

        /// Add ticker to tickerMap
        _tickerMap[ticker.symbol] = ticker;

        /// Add the ticker - coin to stream to emit data
        _tickerStreamController.add(_tickerMap);
        // debugPrint(' tickerMap length: ${_tickerMap.length}');
      }, onError: (error) {
        debugPrint('Error on listen to _tickerChannel: $error');
      }, onDone: () {
        debugPrint('_tickerChannel stream closed');
      });
    } catch (e) {
      debugPrint('Failed to connect to tickers: $e');
    }
  }

  /// dispose ticker
  Future<void> disposeTicker() async {
    _tickerStreamController.close();
    if (_tickerChannel != null) {
      await _tickerChannel?.sink.close();
      _tickerStreamController.close();
    }
  }

  /// Orderbook

  /// base orderbook url
  static const String _baseOrderbookUrl = 'wss://stream.binance.com:9443/ws/';

  /// StreamController for orderbook data
  StreamController<Orderbook> _oderbookStreamController =
      StreamController<Orderbook>.broadcast();

  /// Stream for orderbook data to listen
  Stream<Orderbook> get orderbookStream => _oderbookStreamController.stream;

  WebSocketChannel? _orderbookChannel;

  /// Connect to orderbook
  Future<void> connectToOrderbook({required String symbol}) async {
    await disposeOrderbook();
    try {
      final url = '$_baseOrderbookUrl${symbol.toLowerCase()}@depth';

      /// create websocket channel
      _orderbookChannel = WebSocketChannel.connect(Uri.parse(url));

      /// re-create orderbook stream controller
      _oderbookStreamController = StreamController<Orderbook>.broadcast();

      if (_orderbookChannel == null) return;

      /// listen to websocket channel
      _orderbookChannel!.stream.listen((message) {
        // convert from string to json
        final data = jsonDecode(message);

        if (data == null) return;

        // convert from json to Orderbook object
        final orderbook = Orderbook.fromJson(data);

        // add orderbook to stream to emit data
        _oderbookStreamController.add(orderbook);
      }, onError: (error) {
        debugPrint('Error on listen to _orderbookChannel: $error');
      }, onDone: () {
        debugPrint('_orderbookChannel stream closed');
      });
    } catch (e) {
      debugPrint('Failed to connect to orderbook: $e');
    }
  }

  /// dispose orderbook
  Future<void> disposeOrderbook() async {
    _oderbookStreamController.close();
    if (_orderbookChannel != null) {
      await _orderbookChannel?.sink.close();
      _oderbookStreamController.close();
    }
  }
}
