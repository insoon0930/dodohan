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
    manStatus: $enumDecodeNullable(_$MatchStatusEnumMap, json['manStatus']) ??
        MatchStatus.unChecked,
    womanStatus:
        $enumDecodeNullable(_$MatchStatusEnumMap, json['womanStatus']) ??
            MatchStatus.unChecked,
    createdAt: _$JsonConverterFromJson<Timestamp, DateTime>(
        json['createdAt'], const DateTimeConverter().fromJson),
  );
}

Map<String, dynamic> _$MatchToJson(Match instance) => <String, dynamic>{
      'id': instance.id,
      'man': instance.man,
      'woman': instance.woman,
      'manStatus': _$MatchStatusEnumMap[instance.manStatus]!,
      'womanStatus': _$MatchStatusEnumMap[instance.womanStatus]!,
      'createdAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.createdAt, const DateTimeConverter().toJson),
    };

const _$MatchStatusEnumMap = {
  MatchStatus.unChecked: 'unChecked',
  MatchStatus.checked: 'checked',
  MatchStatus.confirmed: 'confirmed',
  MatchStatus.rejected: 'rejected',
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
