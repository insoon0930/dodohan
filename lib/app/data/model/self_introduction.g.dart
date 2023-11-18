// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'self_introduction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SelfIntroduction _$SelfIntroductionFromJson(Map<String, dynamic> json) =>
    SelfIntroduction(
      id: json['id'] as String? ?? '',
      image: json['image'] as String? ?? '',
      title: json['title'] as String? ?? '',
      text: json['text'] as String? ?? '',
      meInfo: _$JsonConverterFromJson<Map<String, dynamic>, MeInfo>(
          json['meInfo'], const MeInfoConverter().fromJson),
      profileImage: json['profileImage'] as String? ?? '',
      phoneNum: json['phoneNum'] as String? ?? '',
      region: json['region'] as String? ?? '',
      sameUnivOnly: json['sameUnivOnly'] as bool? ?? false,
      applicants: (json['applicants'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      createdAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['createdAt'], const DateTimeConverter().fromJson),
      deletedAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['deletedAt'], const DateTimeConverter().fromJson),
      adminDeletedAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['adminDeletedAt'], const DateTimeConverter().fromJson),
    );

Map<String, dynamic> _$SelfIntroductionToJson(SelfIntroduction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'title': instance.title,
      'text': instance.text,
      'meInfo': _$JsonConverterToJson<Map<String, dynamic>, MeInfo>(
          instance.meInfo, const MeInfoConverter().toJson),
      'profileImage': instance.profileImage,
      'phoneNum': instance.phoneNum,
      'region': instance.region,
      'sameUnivOnly': instance.sameUnivOnly,
      'applicants': instance.applicants,
      'createdAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.createdAt, const DateTimeConverter().toJson),
      'deletedAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.deletedAt, const DateTimeConverter().toJson),
      'adminDeletedAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.adminDeletedAt, const DateTimeConverter().toJson),
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
