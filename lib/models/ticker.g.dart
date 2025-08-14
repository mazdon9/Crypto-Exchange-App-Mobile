// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ticker _$TickerFromJson(Map<String, dynamic> json) => Ticker(
      symbol: json['s'] as String,
      lastPrice: json['c'] as String,
      priceChangePercent: json['P'] as String,
      volume: json['v'] as String,
    );

Map<String, dynamic> _$TickerToJson(Ticker instance) => <String, dynamic>{
      's': instance.symbol,
      'P': instance.priceChangePercent,
      'c': instance.lastPrice,
      'v': instance.volume,
    };
