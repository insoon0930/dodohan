import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:dodohan/app/data/model/you_info.dart';
import '../converter/date_time_converter.dart';
import '../converter/me_info_converter.dart';
import '../enums.dart';
import 'me_info.dart';

part 'daily_card.g.dart';

@JsonSerializable()
class DailyCard {
  String id;
  @MeInfoConverter()
  MeInfo? youInfo, meInfo;
  String youProfileImage, meProfileImage;
  CardStatus youStatus, meStatus;
  @DateTimeConverter()
  DateTime? createdAt;

  DailyCard({this.id = '',
      this.youInfo,
      this.meInfo,
      this.youProfileImage = '',
      this.meProfileImage = '',
      this.youStatus = CardStatus.unChecked,
      this.meStatus = CardStatus.unChecked,
      this.createdAt}) {
    createdAt ??= DateTime.now();
  }

  factory DailyCard.fromJson(Map<String, dynamic> json) => _$DailyCardFromJson(json);

  Map<String, dynamic> toJson() => _$DailyCardToJson(this);
}
