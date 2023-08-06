// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Identity _$IdentityFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id'],
  );
  return Identity(
    id: json['id'] as String? ?? '',
    user: json['user'] as String? ?? '',
    profileImage: json['profileImage'] as String? ?? '',
    studentIdImage: json['studentIdImage'] as String? ?? '',
    isMan: json['isMan'] as bool? ?? true,
    status: $enumDecodeNullable(_$IdStatusEnumMap, json['status']) ??
        IdStatus.waiting,
    createdAt: _$JsonConverterFromJson<Timestamp, DateTime>(
        json['createdAt'], const DateTimeConverter().fromJson),
  );
}

Map<String, dynamic> _$IdentityToJson(Identity instance) => <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'profileImage': instance.profileImage,
      'studentIdImage': instance.studentIdImage,
      'isMan': instance.isMan,
      'status': _$IdStatusEnumMap[instance.status]!,
      'createdAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.createdAt, const DateTimeConverter().toJson),
    };

const _$IdStatusEnumMap = {
  IdStatus.waiting: 'waiting',
  IdStatus.confirmed: 'confirmed',
  IdStatus.rejected: 'rejected',
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
