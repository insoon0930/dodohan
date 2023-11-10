// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_opened_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyOpenedCard _$DailyOpenedCardFromJson(Map<String, dynamic> json) =>
    DailyOpenedCard(
      id: json['id'] as String? ?? '',
      me: json['me'] as String,
      you: json['you'] as String,
      createdAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['createdAt'], const DateTimeConverter().fromJson),
    );

Map<String, dynamic> _$DailyOpenedCardToJson(DailyOpenedCard instance) =>
    <String, dynamic>{
      'id': instance.id,
      'me': instance.me,
      'you': instance.you,
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
