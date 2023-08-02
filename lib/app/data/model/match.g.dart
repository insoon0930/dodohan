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
    man: json['man'] == null
        ? null
        : MatchProfile.fromJson(json['man'] as Map<String, dynamic>),
    woman: json['woman'] == null
        ? null
        : MatchProfile.fromJson(json['woman'] as Map<String, dynamic>),
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
  );
}

Map<String, dynamic> _$MatchToJson(Match instance) => <String, dynamic>{
      'id': instance.id,
      'man': instance.man,
      'woman': instance.woman,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
