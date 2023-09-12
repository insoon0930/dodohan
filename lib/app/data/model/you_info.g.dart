// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'you_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YouInfo _$YouInfoFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id'],
  );
  return YouInfo(
    id: json['id'] as String?,
    user: json['user'] as String?,
    univ: json['univ'] as String?,
    bodyShape:
        (json['bodyShape'] as List<dynamic>?)?.map((e) => e as String).toList(),
    isSmoker: json['isSmoker'] as String?,
    exceptSameMajor: json['exceptSameMajor'] as bool?,
    minHeight: json['minHeight'] as int?,
    maxHeight: json['maxHeight'] as int?,
    minAge: json['minAge'] as int?,
    maxAge: json['maxAge'] as int?,
  );
}

Map<String, dynamic> _$YouInfoToJson(YouInfo instance) => <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'univ': instance.univ,
      'isSmoker': instance.isSmoker,
      'bodyShape': instance.bodyShape,
      'exceptSameMajor': instance.exceptSameMajor,
      'minHeight': instance.minHeight,
      'maxHeight': instance.maxHeight,
      'minAge': instance.minAge,
      'maxAge': instance.maxAge,
    };
