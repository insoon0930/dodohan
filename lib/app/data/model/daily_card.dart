import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../core/services/auth_service.dart';
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
  String youPhoneNum, mePhoneNum;
  CardStatus youStatus, meStatus;
  @DateTimeConverter()
  DateTime? createdAt;
  bool youBlockedMe, meBlockedYou;

  DailyCard({this.id = '',
      this.youInfo,
      this.meInfo,
      this.youProfileImage = '',
      this.meProfileImage = '',
      this.youPhoneNum = '',
      this.mePhoneNum = '',
      this.youStatus = CardStatus.unChecked,
      this.meStatus = CardStatus.unChecked,
      this.createdAt,
      this.youBlockedMe = false,
      this.meBlockedYou = false}) {
    createdAt ??= DateTime.now();
  }

  factory DailyCard.fromJson(Map<String, dynamic> json) => _$DailyCardFromJson(json);

  Map<String, dynamic> toJson() => _$DailyCardToJson(this);

  ////confirmed1st, confirmed2nd, rejected2nd
  bool get iAmMe => AuthService.to.user.value.id == meInfo!.user;
  CardStatus get myStatus => iAmMe ? meStatus : youStatus;
  CardStatus get yourStatus => iAmMe ? youStatus : meStatus;
  String get yourPhoneNum => iAmMe ? youPhoneNum : mePhoneNum;
  MeInfo? get yourInfo => iAmMe ? youInfo : meInfo;
  bool get isNotBlurred =>
      (myStatus == CardStatus.confirmed1st ||
          myStatus == CardStatus.confirmed2nd ||
          myStatus == CardStatus.rejected2nd) &&
          (youStatus == CardStatus.confirmed1st ||
              youStatus == CardStatus.confirmed2nd ||
              youStatus == CardStatus.rejected2nd);
  int get differenceInDays => DateTime.now().difference(createdAt!).inDays;
  String get leftDay => 'D-${3 - differenceInDays}';
  String get oppositeProfileImage => iAmMe ? youProfileImage : meProfileImage;
  //ProfileImage
}
