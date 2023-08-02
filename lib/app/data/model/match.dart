import 'package:json_annotation/json_annotation.dart';
import 'match_profile.dart';

part 'match.g.dart';

@JsonSerializable()
class Match {
  @JsonKey(name: 'id', required: true)
  String? id;
  MatchProfile? man;
  MatchProfile? woman;
  DateTime? createdAt;

  Match(
      {this.id,
      this.man,
      this.woman,
      this.createdAt}) {
    createdAt ??= DateTime.now();
  }

  factory Match.fromJson(Map<String, dynamic> json) => _$MatchFromJson(json);

  Map<String, dynamic> toJson() => _$MatchToJson(this);
}
