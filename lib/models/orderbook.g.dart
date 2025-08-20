// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderbook.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Orderbook _$OrderbookFromJson(Map<String, dynamic> json) => Orderbook(
      symbol: json['s'] as String,
      bidsRaw: (json['b'] as List<dynamic>)
          .map((e) => (e as List<dynamic>).map((e) => e as String).toList())
          .toList(),
      asksRaw: (json['a'] as List<dynamic>)
          .map((e) => (e as List<dynamic>).map((e) => e as String).toList())
          .toList(),
    );

Map<String, dynamic> _$OrderbookToJson(Orderbook instance) => <String, dynamic>{
      's': instance.symbol,
      'b': instance.bidsRaw,
      'a': instance.asksRaw,
    };

OrderbookEntry _$OrderbookEntryFromJson(Map<String, dynamic> json) =>
    OrderbookEntry(
      price: json['price'] as String,
      quantity: json['quantity'] as String,
    );

Map<String, dynamic> _$OrderbookEntryToJson(OrderbookEntry instance) =>
    <String, dynamic>{
      'price': instance.price,
      'quantity': instance.quantity,
    };
