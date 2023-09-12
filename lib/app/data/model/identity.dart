import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

import '../converter/date_time_converter.dart';
import '../enums.dart';

part 'identity.g.dart';

@JsonSerializable()
class Identity {
  @JsonKey(name: 'id', required: true)
  String id;
  String user, profileImage, studentIdImage, univ;
  bool isMan;
  IdStatus status;
  @DateTimeConverter()
  DateTime? createdAt;

  Identity(
      {this.id = '',
      this.user = '',
      this.profileImage = '',
      this.studentIdImage = '',
      this.univ = '한양대',
      this.isMan = true,
      this.status = IdStatus.waiting,
      this.createdAt}) {
    createdAt ??= DateTime.now();
  }

  factory Identity.fromJson(Map<String, dynamic> json) =>
      _$IdentityFromJson(json);

  Map<String, dynamic> toJson() => _$IdentityToJson(this);
}
