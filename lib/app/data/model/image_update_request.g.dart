// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_update_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageUpdateRequest _$ImageUpdateRequestFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id'],
  );
  return ImageUpdateRequest(
    id: json['id'] as String? ?? '',
    user: json['user'] as String? ?? '',
    profileImage: json['profileImage'] as String? ?? '',
    status: $enumDecodeNullable(_$IdStatusEnumMap, json['status']) ??
        IdStatus.waiting,
    createdAt: _$JsonConverterFromJson<Timestamp, DateTime>(
        json['createdAt'], const DateTimeConverter().fromJson),
  );
}

Map<String, dynamic> _$ImageUpdateRequestToJson(ImageUpdateRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'profileImage': instance.profileImage,
      'status': _$IdStatusEnumMap[instance.status]!,
      'createdAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.createdAt, const DateTimeConverter().toJson),
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
