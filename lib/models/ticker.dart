import 'package:json_annotation/json_annotation.dart';
part 'ticker.g.dart';

@JsonSerializable()
class Ticker {
  //  {
  //   "e": "24hrTicker",
  //   "E": 1755091019022,
  //   "s": "BTCUSDT",
  //   "p": "1449.05000000",
  //   "P": "1.217",
  //   "w": "119747.20693808",
  //   "x": "119079.46000000",
  //   "c": "120528.50000000",
  //   "Q": "0.00233000",
  //   "b": "120528.49000000",
  //   "B": "9.92076000",
  //   "a": "120528.50000000",
  //   "A": "2.10145000",
  //   "o": "119079.45000000",
  //   "h": "120732.94000000",
  //   "l": "118631.69000000",
  //   "v": "16369.81493000",
  //   "q": "1960239615.96076810",
  //   "O": 1755004619001,
  //   "C": 1755091019001,
  //   "F": 5150610504,
  //   "L": 5153438942,
  //   "n": 2828439
  // example_btc
  // examplBTC
  // }

  @JsonKey(name: 's')
  final String symbol;

  @JsonKey(name: 'P')
  final String priceChangePercent;

  @JsonKey(name: 'c')
  final String lastPrice;

  @JsonKey(name: 'v')
  final String volume;

  Ticker({
    required this.symbol,
    required this.lastPrice,
    required this.priceChangePercent,
    required this.volume,
  });

  factory Ticker.fromJson(Map<String, dynamic> json) => _$TickerFromJson(json);

  Map<String, dynamic> toJson() => _$TickerToJson(this);
}
