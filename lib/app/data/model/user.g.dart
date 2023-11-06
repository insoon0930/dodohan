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
    profileImage: json['profileImage'] as String? ?? '',
    univ: json['univ'] as String? ?? '',
    isMan: json['isMan'] as bool?,
    isAndroid: json['isAndroid'] as bool?,
    coin: json['coin'] as int? ?? 0,
    idStatus: $enumDecodeNullable(_$IdStatusEnumMap, json['idStatus']),
    createdAt: _$JsonConverterFromJson<Timestamp, DateTime>(
        json['createdAt'], const DateTimeConverter().fromJson),
    deletedAt: _$JsonConverterFromJson<Timestamp, DateTime>(
        json['deletedAt'], const DateTimeConverter().fromJson),
    reviewRequestedAt: _$JsonConverterFromJson<Timestamp, DateTime>(
        json['reviewRequestedAt'], const DateTimeConverter().fromJson),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'phoneNum': instance.phoneNum,
      'profileImage': instance.profileImage,
      'univ': instance.univ,
      'isMan': instance.isMan,
      'isAndroid': instance.isAndroid,
      'coin': instance.coin,
      'idStatus': _$IdStatusEnumMap[instance.idStatus],
      'createdAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.createdAt, const DateTimeConverter().toJson),
      'deletedAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.deletedAt, const DateTimeConverter().toJson),
      'reviewRequestedAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.reviewRequestedAt, const DateTimeConverter().toJson),
    };

const _$IdStatusEnumMap = {
  IdStatus.waiting: 'waiting',
  IdStatus.confirmed: 'confirmed',
  IdStatus.rejected: 'rejected',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
