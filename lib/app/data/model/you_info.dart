import 'package:json_annotation/json_annotation.dart';

part 'you_info.g.dart';

@JsonSerializable()
class YouInfo {
  @JsonKey(name: 'id', required: true)
  String? id;
  String? user, univ, isSmoker;
  List<String>? bodyShape;
  bool? exceptSameMajor;
  int? minHeight, maxHeight, minAge, maxAge;

  YouInfo(
      {this.id,
      this.user,
      this.univ,
      this.bodyShape,
      this.isSmoker,
      this.exceptSameMajor,
      this.minHeight,
      this.maxHeight,
      this.minAge,
      this.maxAge});

  factory YouInfo.fromJson(Map<String, dynamic> json) =>
      _$YouInfoFromJson(json);

  Map<String, dynamic> toJson() => _$YouInfoToJson(this);

  bool get isCompleted => !toJson().containsValue(null);
}
