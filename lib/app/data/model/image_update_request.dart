import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

import '../converter/date_time_converter.dart';
import '../enums.dart';

part 'image_update_request.g.dart';

@JsonSerializable()
class ImageUpdateRequest {
  @JsonKey(name: 'id', required: true)
  String id;
  String user, newProfileImage, preProfileImage;
  IdStatus status;
  @DateTimeConverter()
  DateTime? createdAt;
  bool coinUsed;

  ImageUpdateRequest(
      {this.id = '',
        this.user = '',
        this.newProfileImage = '',
        this.preProfileImage = '',
        this.status = IdStatus.waiting,
        this.createdAt,
        this.coinUsed = false}) {
    createdAt ??= DateTime.now();
  }

  factory ImageUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$ImageUpdateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ImageUpdateRequestToJson(this);
}
