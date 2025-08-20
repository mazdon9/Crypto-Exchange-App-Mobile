import 'package:json_annotation/json_annotation.dart';
part 'orderbook.g.dart';

@JsonSerializable()
class Orderbook {
  // "e": "depthUpdate",
  // "E": 1755697342014,
  // "s": "BTCUSDT",
  // "U": 74935862785,
  // "u": 74935863881,
  // "b": [
  //   [
  //     "113282.24000000",
  //     "4.27287000"
  //   ],
  // ],
  //  "a": [
  //   [
  //     "113282.24000000",
  //     "4.27287000"
  //   ],
  // ]

  @JsonKey(name: 's')
  final String symbol;

  @JsonKey(name: 'b')
  final List<List<String>> bidsRaw;

  @JsonKey(name: 'a')
  final List<List<String>> asksRaw;

  Orderbook({
    required this.symbol,
    required this.bidsRaw,
    required this.asksRaw,
  });

  factory Orderbook.fromJson(Map<String, dynamic> json) =>
      _$OrderbookFromJson(json);

  Map<String, dynamic> toJson() => _$OrderbookToJson(this);

  /// Map bids to OrderbookEntry with price and quantity
  List<OrderbookEntry> get bids => bidsRaw
      .map((bid) => OrderbookEntry(price: bid[0], quantity: bid[1]))
      .toList();

  /// Map asks to OrderbookEntry with price and quantity)
  List<OrderbookEntry> get asks => asksRaw
      .map((bid) => OrderbookEntry(price: bid[0], quantity: bid[1]))
      .toList();
}

@JsonSerializable()
class OrderbookEntry {
  final String price;
  final String quantity;

  OrderbookEntry({
    required this.price,
    required this.quantity,
  });

  factory OrderbookEntry.fromJson(Map<String, dynamic> json) =>
      _$OrderbookEntryFromJson(json);

  Map<String, dynamic> toJson() => _$OrderbookEntryToJson(this);
}
