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
    meInfo: json['meInfo'] == null
        ? null
        : MeInfo.fromJson(json['meInfo'] as Map<String, dynamic>),
    youInfo: json['youInfo'] == null
        ? null
        : YouInfo.fromJson(json['youInfo'] as Map<String, dynamic>),
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
  );
}

Map<String, dynamic> _$ApplicationToJson(Application instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'meInfo': instance.meInfo!.toJson(),
      'youInfo': instance.youInfo!.toJson(),
      'createdAt': instance.createdAt?.toIso8601String(),
    };
