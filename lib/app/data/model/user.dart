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
  bool? isMan;
  IdStatus? idStatus;
  @DateTimeConverter()
  DateTime? createdAt;
  @DateTimeConverter()
  DateTime? deletedAt;

  User({this.id = '',
    this.uid = '',
    this.phoneNum = '',
    this.profileImage = '',
    this.univ = '',
    this.isMan,
    this.idStatus,
    this.createdAt,
    this.deletedAt,
  }) {
    createdAt ??= DateTime.now();
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  // bool get saveOriginal => cameraSetting['saveOriginal'];
  // bool get saveImmediately => cameraSetting['saveImmediately'];
  // bool get cameraImmediately => cameraSetting['cameraImmediately'];
  //
  // bool get color => stampSetting['color'];
  // bool get stamp => stampSetting['stamp'];
  // bool get time => stampSetting['time'];
  // bool get format => stampSetting['format'];
}
