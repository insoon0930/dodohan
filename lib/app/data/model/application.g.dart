// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Application _$ApplicationFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id'],
  );
  return Application(
    id: json['id'] as String? ?? '',
    user: json['user'] as String?,
    meInfo: _$JsonConverterFromJson<Map<String, dynamic>, MeInfo>(
        json['meInfo'], const MeInfoConverter().fromJson),
    youInfo: _$JsonConverterFromJson<Map<String, dynamic>, YouInfo>(
        json['youInfo'], const YouInfoConverter().fromJson),
    createdAt: _$JsonConverterFromJson<Timestamp, DateTime>(
        json['createdAt'], const DateTimeConverter().fromJson),
    isRewarded: json['isRewarded'] as bool? ?? false,
  );
}

Map<String, dynamic> _$ApplicationToJson(Application instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'meInfo': _$JsonConverterToJson<Map<String, dynamic>, MeInfo>(
          instance.meInfo, const MeInfoConverter().toJson),
      'youInfo': _$JsonConverterToJson<Map<String, dynamic>, YouInfo>(
          instance.youInfo, const YouInfoConverter().toJson),
      'createdAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.createdAt, const DateTimeConverter().toJson),
      'isRewarded': instance.isRewarded,
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
