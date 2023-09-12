// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'me_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeInfo _$MeInfoFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id'],
  );
  return MeInfo(
    id: json['id'] as String?,
    user: json['user'] as String?,
    univ: json['univ'] as String?,
    major: json['major'] as String?,
    bodyShape: json['bodyShape'] as String?,
    isMan: json['isMan'] as bool?,
    isSmoker: json['isSmoker'] as bool?,
    height: json['height'] as int?,
    age: json['age'] as int?,
  );
}

Map<String, dynamic> _$MeInfoToJson(MeInfo instance) => <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'univ': instance.univ,
      'major': instance.major,
      'bodyShape': instance.bodyShape,
      'isMan': instance.isMan,
      'isSmoker': instance.isSmoker,
      'height': instance.height,
      'age': instance.age,
    };
