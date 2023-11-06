import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import '../converter/date_time_converter.dart';
import '../enums.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: 'id', required: true)
  String id;
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

  User({this.id = '',
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
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
