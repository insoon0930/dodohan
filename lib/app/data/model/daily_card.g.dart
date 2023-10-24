// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyCard _$DailyCardFromJson(Map<String, dynamic> json) => DailyCard(
      id: json['id'] as String? ?? '',
      youInfo: _$JsonConverterFromJson<Map<String, dynamic>, MeInfo>(
          json['youInfo'], const MeInfoConverter().fromJson),
      meInfo: _$JsonConverterFromJson<Map<String, dynamic>, MeInfo>(
          json['meInfo'], const MeInfoConverter().fromJson),
      youProfileImage: json['youProfileImage'] as String? ?? '',
      meProfileImage: json['meProfileImage'] as String? ?? '',
      youPhoneNum: json['youPhoneNum'] as String? ?? '',
      mePhoneNum: json['mePhoneNum'] as String? ?? '',
      youStatus: $enumDecodeNullable(_$CardStatusEnumMap, json['youStatus']) ??
          CardStatus.unChecked,
      meStatus: $enumDecodeNullable(_$CardStatusEnumMap, json['meStatus']) ??
          CardStatus.unChecked,
      createdAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['createdAt'], const DateTimeConverter().fromJson),
    );

Map<String, dynamic> _$DailyCardToJson(DailyCard instance) => <String, dynamic>{
      'id': instance.id,
      'youInfo': _$JsonConverterToJson<Map<String, dynamic>, MeInfo>(
          instance.youInfo, const MeInfoConverter().toJson),
      'meInfo': _$JsonConverterToJson<Map<String, dynamic>, MeInfo>(
          instance.meInfo, const MeInfoConverter().toJson),
      'youProfileImage': instance.youProfileImage,
      'meProfileImage': instance.meProfileImage,
      'youPhoneNum': instance.youPhoneNum,
      'mePhoneNum': instance.mePhoneNum,
      'youStatus': _$CardStatusEnumMap[instance.youStatus]!,
      'meStatus': _$CardStatusEnumMap[instance.meStatus]!,
      'createdAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.createdAt, const DateTimeConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

const _$CardStatusEnumMap = {
  CardStatus.unChecked: 'unChecked',
  CardStatus.checked: 'checked',
  CardStatus.confirmed1st: 'confirmed1st',
  CardStatus.rejected1st: 'rejected1st',
  CardStatus.confirmed2nd: 'confirmed2nd',
  CardStatus.rejected2nd: 'rejected2nd',
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
