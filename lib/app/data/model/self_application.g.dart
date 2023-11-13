// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'self_application.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SelfApplication _$SelfApplicationFromJson(Map<String, dynamic> json) =>
    SelfApplication(
      id: json['id'] as String? ?? '',
      meInfo: _$JsonConverterFromJson<Map<String, dynamic>, MeInfo>(
          json['meInfo'], const MeInfoConverter().fromJson),
      profileImage: json['profileImage'] as String? ?? '',
      phoneNum: json['phoneNum'] as String? ?? '',
      status:
          $enumDecodeNullable(_$SelfApplicationStatusEnumMap, json['status']) ??
              SelfApplicationStatus.closed,
      createdAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['createdAt'], const DateTimeConverter().fromJson),
    );

Map<String, dynamic> _$SelfApplicationToJson(SelfApplication instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meInfo': _$JsonConverterToJson<Map<String, dynamic>, MeInfo>(
          instance.meInfo, const MeInfoConverter().toJson),
      'profileImage': instance.profileImage,
      'phoneNum': instance.phoneNum,
      'status': _$SelfApplicationStatusEnumMap[instance.status]!,
      'createdAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.createdAt, const DateTimeConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

const _$SelfApplicationStatusEnumMap = {
  SelfApplicationStatus.closed: 'closed',
  SelfApplicationStatus.openedByApplicant: 'openedByApplicant',
  SelfApplicationStatus.openedByOwner: 'openedByOwner',
  SelfApplicationStatus.confirmed: 'confirmed',
  SelfApplicationStatus.rejected: 'rejected',
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
