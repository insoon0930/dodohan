// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyCard _$DailyCardFromJson(Map<String, dynamic> json) => DailyCard(
      youInfo: _$JsonConverterFromJson<Map<String, dynamic>, MeInfo>(
          json['youInfo'], const MeInfoConverter().fromJson),
      meInfo: _$JsonConverterFromJson<Map<String, dynamic>, MeInfo>(
          json['meInfo'], const MeInfoConverter().fromJson),
      youProfileImage: json['youProfileImage'] as String? ?? '',
      meProfileImage: json['meProfileImage'] as String? ?? '',
      youStatus: $enumDecodeNullable(_$MatchStatusEnumMap, json['youStatus']) ??
          MatchStatus.unChecked,
      meStatus: $enumDecodeNullable(_$MatchStatusEnumMap, json['meStatus']) ??
          MatchStatus.unChecked,
      createdAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['createdAt'], const DateTimeConverter().fromJson),
    );

Map<String, dynamic> _$DailyCardToJson(DailyCard instance) => <String, dynamic>{
      'youInfo': _$JsonConverterToJson<Map<String, dynamic>, MeInfo>(
          instance.youInfo, const MeInfoConverter().toJson),
      'meInfo': _$JsonConverterToJson<Map<String, dynamic>, MeInfo>(
          instance.meInfo, const MeInfoConverter().toJson),
      'youProfileImage': instance.youProfileImage,
      'meProfileImage': instance.meProfileImage,
      'youStatus': _$MatchStatusEnumMap[instance.youStatus]!,
      'meStatus': _$MatchStatusEnumMap[instance.meStatus]!,
      'createdAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.createdAt, const DateTimeConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

const _$MatchStatusEnumMap = {
  MatchStatus.unChecked: 'unChecked',
  MatchStatus.checked: 'checked',
  MatchStatus.confirmed: 'confirmed',
  MatchStatus.rejected: 'rejected',
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
