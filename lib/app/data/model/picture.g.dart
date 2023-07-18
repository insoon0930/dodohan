// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'picture.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Picture _$PictureFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id'],
  );
  return Picture(
    id: json['id'] as String? ?? '',
    url: json['url'] as String? ?? '',
    userId: json['userId'] as String? ?? '',
    folderId: json['folderId'] as String? ?? '',
    stampSetting: json['stampSetting'] as Map<String, dynamic>? ??
        const {
          'color': 'red',
          'stamp': 'stamp_1',
          'time': null,
          'format': 'format_1'
        },
  );
}

Map<String, dynamic> _$PictureToJson(Picture instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'userId': instance.userId,
      'folderId': instance.folderId,
      'stampSetting': instance.stampSetting,
    };
