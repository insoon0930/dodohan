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
    isMan: json['isMan'] as bool? ?? false,
    idStatus: $enumDecodeNullable(_$IdStatusEnumMap, json['idStatus']),
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
      'isMan': instance.isMan,
      'idStatus': _$IdStatusEnumMap[instance.idStatus],
      'createdAt': instance.createdAt?.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };

const _$IdStatusEnumMap = {
  IdStatus.waiting: 'waiting',
  IdStatus.confirmed: 'confirmed',
  IdStatus.rejected: 'rejected',
};
