// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchProfile _$MatchProfileFromJson(Map<String, dynamic> json) => MatchProfile(
      userId: json['userId'] as String? ?? '',
      phoneNum: json['phoneNum'] as String? ?? '',
      profileImage: json['profileImage'] as String? ?? '',
    );

Map<String, dynamic> _$MatchProfileToJson(MatchProfile instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'phoneNum': instance.phoneNum,
      'profileImage': instance.profileImage,
    };
