import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import '../converter/date_time_converter.dart';
import 'match_profile.dart';

part 'match.g.dart';

@JsonSerializable()
class Match {
  @JsonKey(name: 'id', required: true)
  String? id;
  String man, woman;
  @DateTimeConverter()
  DateTime? createdAt;

  Match(
      {this.id,
      this.man = '',
      this.woman = '',
      this.createdAt}) {
    createdAt ??= DateTime.now();
  }

  factory Match.fromJson(Map<String, dynamic> json) => _$MatchFromJson(json);

  Map<String, dynamic> toJson() => _$MatchToJson(this);
}
