// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pg_bill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PgBill _$PgBillFromJson(Map<String, dynamic> json) => PgBill(
      id: json['id'] as String? ?? '',
      customer: json['customer'] as String,
      data: json['data'] as Map<String, dynamic>,
    )..createdAt = _$JsonConverterFromJson<Timestamp, DateTime>(
        json['createdAt'], const DateTimeConverter().fromJson);

Map<String, dynamic> _$PgBillToJson(PgBill instance) => <String, dynamic>{
      'id': instance.id,
      'customer': instance.customer,
      'data': instance.data,
      'createdAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.createdAt, const DateTimeConverter().toJson),
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
