import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dodohan/core/services/auth_service.dart';
import 'package:json_annotation/json_annotation.dart';
import '../converter/date_time_converter.dart';
import '../enums.dart';

part 'match.g.dart';

@JsonSerializable()
class Match {
  @JsonKey(name: 'id', required: true)
  String? id;
  String man, woman;
  MatchStatus manStatus;
  MatchStatus womanStatus;
  @DateTimeConverter()
  DateTime? createdAt;

  Match(
      {this.id,
      this.man = '',
      this.woman = '',
      this.manStatus = MatchStatus.unChecked,
      this.womanStatus = MatchStatus.unChecked,
      this.createdAt}) {
    createdAt ??= DateTime.now();
  }

  factory Match.fromJson(Map<String, dynamic> json) => _$MatchFromJson(json);

  Map<String, dynamic> toJson() => _$MatchToJson(this);

  String get you => AuthService.to.user.value.isMan! ? woman : man;
  MatchStatus get youStatus => AuthService.to.user.value.isMan! ? womanStatus : manStatus;
  MatchStatus get meStatus => AuthService.to.user.value.isMan! ? manStatus : womanStatus;
  bool get isFinalMatchSucceeded => manStatus == MatchStatus.confirmed && womanStatus == MatchStatus.confirmed;
  bool get hasMadeDecision => meStatus == MatchStatus.confirmed || meStatus == MatchStatus.rejected;
}
