import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import '../converter/date_time_converter.dart';
import '../enums.dart';
import '../info_data.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: 'id', required: true)
  String id;
  String? fcmToken;
  String uid, phoneNum, profileImage, univ;
  bool? isMan, isAndroid;
  int coin;
  IdStatus? idStatus;
  @DateTimeConverter()
  DateTime? createdAt;
  @DateTimeConverter()
  DateTime? deletedAt;
  @DateTimeConverter()
  DateTime? reviewRequestedAt;
  @DateTimeConverter()
  DateTime? lastVisitedAt;

  User({this.id = '',
    this.fcmToken,
    this.uid = '',
    this.phoneNum = '',
    this.profileImage = '',
    this.univ = '',
    this.isMan,
    this.isAndroid,
    this.coin = 0,
    this.idStatus,
    this.createdAt,
    this.deletedAt,
    this.reviewRequestedAt,
  }) {
    createdAt ??= DateTime.now();
    lastVisitedAt ??= DateTime.now();
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
  String get region => InfoData.univInfo[univ]!.region.name;
  bool get hasFourDailyCards => !isMan!;
  bool get isWomanUniv => InfoData.univInfo[univ]?.isWomanUniv ?? false;
}
