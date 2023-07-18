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
    id: json['id'] as String? ?? '',
    univ: json['univ'] as String? ?? '',
    major: json['major'] as String? ?? '',
    bodyShape: json['bodyShape'] as String? ?? '',
    isMan: json['isMan'] as bool? ?? true,
    isSmoker: json['isSmoker'] as bool? ?? true,
    height: json['height'] as int? ?? 0,
    age: json['age'] as int? ?? 0,
  );
}

Map<String, dynamic> _$MeInfoToJson(MeInfo instance) => <String, dynamic>{
      'id': instance.id,
      'univ': instance.univ,
      'major': instance.major,
      'bodyShape': instance.bodyShape,
      'isMan': instance.isMan,
      'isSmoker': instance.isSmoker,
      'height': instance.height,
      'age': instance.age,
    };
