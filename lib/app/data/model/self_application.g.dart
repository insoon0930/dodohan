// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'self_application.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SelfApplication _$SelfApplicationFromJson(Map<String, dynamic> json) =>
    SelfApplication(
      id: json['id'] as String? ?? '',
      selfIntroductionId: json['selfIntroductionId'] as String,
      meInfo: const MeInfoConverter()
          .fromJson(json['meInfo'] as Map<String, dynamic>),
      profileImage: json['profileImage'] as String,
      phoneNum: json['phoneNum'] as String,
      status:
          $enumDecodeNullable(_$SelfApplicationStatusEnumMap, json['status']) ??
              SelfApplicationStatus.closed,
      createdAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['createdAt'], const DateTimeConverter().fromJson),
    );

Map<String, dynamic> _$SelfApplicationToJson(SelfApplication instance) =>
    <String, dynamic>{
      'id': instance.id,
      'selfIntroductionId': instance.selfIntroductionId,
      'meInfo': const MeInfoConverter().toJson(instance.meInfo),
      'profileImage': instance.profileImage,
      'phoneNum': instance.phoneNum,
      'status': _$SelfApplicationStatusEnumMap[instance.status]!,
      'createdAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.createdAt, const DateTimeConverter().toJson),
    };

const _$SelfApplicationStatusEnumMap = {
  SelfApplicationStatus.closed: 'closed',
  SelfApplicationStatus.openedByApplicant: 'openedByApplicant',
  SelfApplicationStatus.openedByOwner: 'openedByOwner',
  SelfApplicationStatus.confirmed1st: 'confirmed1st',
  SelfApplicationStatus.confirmed2nd: 'confirmed2nd',
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
