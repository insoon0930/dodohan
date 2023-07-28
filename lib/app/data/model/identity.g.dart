// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Identity _$IdentityFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id'],
  );
  return Identity(
    id: json['id'] as String? ?? '',
    user: json['user'] as String? ?? '',
    profileImage: json['profileImage'] as String? ?? '',
    studentIdImage: json['studentIdImage'] as String? ?? '',
    isMan: json['isMan'] as bool? ?? true,
    status: $enumDecodeNullable(_$IdStatusEnumMap, json['status']) ??
        IdStatus.waiting,
  );
}

Map<String, dynamic> _$IdentityToJson(Identity instance) => <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'profileImage': instance.profileImage,
      'studentIdImage': instance.studentIdImage,
      'isMan': instance.isMan,
      'status': _$IdStatusEnumMap[instance.status]!,
    };

const _$IdStatusEnumMap = {
  IdStatus.waiting: 'waiting',
  IdStatus.confirmed: 'confirmed',
  IdStatus.rejected: 'rejected',
};
