// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id'],
  );
  return User(
    id: json['id'] as String? ?? '',
    uid: json['uid'] as String? ?? '',
    phoneNum: json['phoneNum'] as String? ?? '',
    isAndroid: json['isAndroid'] as bool?,
    folders:
        (json['folders'] as List<dynamic>?)?.map((e) => e as String).toList() ??
            const [],
    cameraSetting: json['cameraSetting'] as Map<String, dynamic>? ??
        const {
          'saveOriginal': true,
          'saveImmediately': true,
          'cameraImmediately': true
        },
    stampSetting: json['stampSetting'] as Map<String, dynamic>? ??
        const {
          'color': 'red',
          'stamp': 'stamp_1',
          'time': null,
          'format': 'format_1'
        },
    darkMode: json['darkMode'] as bool? ?? false,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    deletedAt: json['deletedAt'] == null
        ? null
        : DateTime.parse(json['deletedAt'] as String),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'phoneNum': instance.phoneNum,
      'isAndroid': instance.isAndroid,
      'folders': instance.folders,
      'cameraSetting': instance.cameraSetting,
      'stampSetting': instance.stampSetting,
      'darkMode': instance.darkMode,
      'createdAt': instance.createdAt?.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };
