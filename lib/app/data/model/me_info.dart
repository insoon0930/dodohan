import 'package:json_annotation/json_annotation.dart';

part 'me_info.g.dart';

@JsonSerializable()
class MeInfo {
  @JsonKey(name: 'id', required: true)
  String id;
  String univ, major, bodyShape;
  bool isMan, isSmoker;
  int height, age;

  MeInfo(
      {this.id = '',
      this.univ = '',
      this.major = '',
      this.bodyShape = '',
      this.isMan = true,
      this.isSmoker = true,
      this.height = 0,
      this.age = 0});

  factory MeInfo.fromJson(Map<String, dynamic> json) =>
      _$MeInfoFromJson(json);

  Map<String, dynamic> toJson() => _$MeInfoToJson(this);
}
