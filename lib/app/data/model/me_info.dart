import 'package:json_annotation/json_annotation.dart';

import '../info_data.dart';

part 'me_info.g.dart';

@JsonSerializable()
class MeInfo {
  @JsonKey(name: 'id', required: true)
  String? id;
  String? user, univ, major, bodyShape;
  bool? isMan, isSmoker;
  int? height, age;

  MeInfo({this.id,
      this.user,
      this.univ,
      this.major,
      this.bodyShape,
      this.isMan,
      this.isSmoker,
      this.height,
      this.age});

  factory MeInfo.fromJson(Map<String, dynamic> json) =>
      _$MeInfoFromJson(json);

  Map<String, dynamic> toJson() => _$MeInfoToJson(this);

  bool get isCompleted => !toJson().containsValue(null);
  String get region => InfoData.univInfo[univ]!.region.name;
}
