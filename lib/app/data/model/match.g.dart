// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Match _$MatchFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id'],
  );
  return Match(
    id: json['id'] as String?,
    man: json['man'] as String? ?? '',
    woman: json['woman'] as String? ?? '',
    createdAt: _$JsonConverterFromJson<Timestamp, DateTime>(
        json['createdAt'], const DateTimeConverter().fromJson),
  );
}

Map<String, dynamic> _$MatchToJson(Match instance) => <String, dynamic>{
      'id': instance.id,
      'man': instance.man,
      'woman': instance.woman,
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
