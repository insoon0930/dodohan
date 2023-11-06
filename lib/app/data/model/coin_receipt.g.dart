// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_receipt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinReceipt _$CoinReceiptFromJson(Map<String, dynamic> json) => CoinReceipt(
      id: json['id'] as String? ?? '',
      user: json['user'] as String,
      amount: json['amount'] as int,
      type: $enumDecode(_$CoinReceiptTypeEnumMap, json['type']),
    )..createdAt = _$JsonConverterFromJson<Timestamp, DateTime>(
        json['createdAt'], const DateTimeConverter().fromJson);

Map<String, dynamic> _$CoinReceiptToJson(CoinReceipt instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'amount': instance.amount,
      'type': _$CoinReceiptTypeEnumMap[instance.type]!,
      'createdAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.createdAt, const DateTimeConverter().toJson),
    };

const _$CoinReceiptTypeEnumMap = {
  CoinReceiptType.chargeCoin: 'chargeCoin',
  CoinReceiptType.dailyReject: 'dailyReject',
  CoinReceiptType.weeklyReject: 'weeklyReject',
  CoinReceiptType.consoleReward: 'consoleReward',
  CoinReceiptType.dailyCard: 'dailyCard',
  CoinReceiptType.weeklyMatch: 'weeklyMatch',
  CoinReceiptType.dailyReward: 'dailyReward',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
