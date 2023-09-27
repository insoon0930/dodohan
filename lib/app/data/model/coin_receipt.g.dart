// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_receipt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinReceipt _$CoinReceiptFromJson(Map<String, dynamic> json) => CoinReceipt(
      id: json['id'] as String? ?? '',
      customer: json['customer'] as String,
      amount: json['amount'] as int,
      type: $enumDecode(_$CoinReceiptTypeEnumMap, json['type']),
      data: json['data'] as Map<String, dynamic>?,
    )..createdAt = _$JsonConverterFromJson<Timestamp, DateTime>(
        json['createdAt'], const DateTimeConverter().fromJson);

Map<String, dynamic> _$CoinReceiptToJson(CoinReceipt instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customer': instance.customer,
      'amount': instance.amount,
      'type': _$CoinReceiptTypeEnumMap[instance.type]!,
      'data': instance.data,
      'createdAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.createdAt, const DateTimeConverter().toJson),
    };

const _$CoinReceiptTypeEnumMap = {
  CoinReceiptType.chargeCoin: 'chargeCoin',
  CoinReceiptType.rejectReward: 'rejectReward',
  CoinReceiptType.consoleReward: 'consoleReward',
  CoinReceiptType.dailyCard: 'dailyCard',
  CoinReceiptType.weeklyMatch: 'weeklyMatch',
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
