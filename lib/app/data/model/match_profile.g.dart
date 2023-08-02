// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchProfile _$MatchProfileFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id'],
  );
  return MatchProfile(
    id: json['id'] as String?,
    userId: json['userId'] as String? ?? '',
    phoneNum: json['phoneNum'] as String? ?? '',
    profileImage: json['profileImage'] as String? ?? '',
  );
}

Map<String, dynamic> _$MatchProfileToJson(MatchProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'phoneNum': instance.phoneNum,
      'profileImage': instance.profileImage,
    };
