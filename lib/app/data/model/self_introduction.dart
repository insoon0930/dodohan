import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dodohan/app/data/model/self_application.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../core/services/auth_service.dart';
import '../converter/date_time_converter.dart';
import '../converter/me_info_converter.dart';
import '../enums.dart';
import 'me_info.dart';

part 'self_introduction.g.dart';

@JsonSerializable()
class SelfIntroduction {
  String id;
  String image;
  String title, text;
  @MeInfoConverter()
  MeInfo? meInfo;
  String profileImage, phoneNum;
  bool sameUnivOnly;
  List<SelfApplication> applications; //todo converter 달아야할듯?
  @DateTimeConverter()
  DateTime? createdAt, deletedAt, adminDeletedAt;

  SelfIntroduction({this.id = '',
      this.image = '',
      this.title = '',
      this.text = '',
      this.meInfo,
      this.profileImage = '',
      this.phoneNum = '',
      this.sameUnivOnly = false,
      this.applications = const [],
      this.createdAt,
      this.deletedAt,
      this.adminDeletedAt}) {
    createdAt ??= DateTime.now();
  }

  factory SelfIntroduction.fromJson(json) => _$SelfIntroductionFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$SelfIntroductionToJson(this);

  int get differenceInDays => DateTime.now().difference(createdAt!).inDays;
}
