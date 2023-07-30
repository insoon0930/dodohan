import 'package:json_annotation/json_annotation.dart';

import '../enums.dart';

part 'identity.g.dart';

@JsonSerializable()
class Identity {
  @JsonKey(name: 'id', required: true)
  String id;
  String user, profileImage, studentIdImage;
  bool isMan;
  IdStatus status;

  Identity(
      {this.id = '',
      this.user = '',
      this.profileImage = '',
      this.studentIdImage = '',
      this.isMan = true,
      this.status = IdStatus.waiting});

  factory Identity.fromJson(Map<String, dynamic> json) =>
      _$IdentityFromJson(json);

  Map<String, dynamic> toJson() => _$IdentityToJson(this);
}
