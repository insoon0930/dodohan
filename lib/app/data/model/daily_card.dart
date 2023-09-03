import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:stamp_now/app/data/model/you_info.dart';
import '../converter/date_time_converter.dart';
import '../converter/me_info_converter.dart';
import '../enums.dart';
import 'me_info.dart';

part 'daily_card.g.dart';

@JsonSerializable()
class DailyCard {
  @MeInfoConverter()
  MeInfo? youInfo, meInfo;
  String youProfileImage, meProfileImage;
  MatchStatus youStatus, meStatus;
  @DateTimeConverter()
  DateTime? createdAt;

  DailyCard({this.youInfo,
      this.meInfo,
      this.youProfileImage = '',
      this.meProfileImage = '',
      this.youStatus = MatchStatus.unChecked,
      this.meStatus = MatchStatus.unChecked,
      this.createdAt}) {
    createdAt ??= DateTime.now();
  }

  factory DailyCard.fromJson(Map<String, dynamic> json) => _$DailyCardFromJson(json);

  Map<String, dynamic> toJson() => _$DailyCardToJson(this);
}
