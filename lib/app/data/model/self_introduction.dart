import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dodohan/app/data/model/self_application.dart';
import 'package:dodohan/app/data/model/user.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../core/services/auth_service.dart';
import '../converter/date_time_converter.dart';
import '../converter/me_info_converter.dart';
import '../converter/self_application_info_converter.dart';
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
  String region; //regionFilter value
  bool sameUnivOnly;
  @SelfApplicationConverter()
  List<SelfApplication> applications;
  @DateTimeConverter()
  DateTime? createdAt, deletedAt, adminDeletedAt;

  SelfIntroduction({this.id = '',
      this.image = '',
      this.title = '',
      this.text = '',
      this.meInfo,
      this.profileImage = '',
      this.phoneNum = '',
      this.region = '',
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
  String get leftDay => 'D-${7 - differenceInDays}';

  User get user => AuthService.to.user.value;
  bool get isMine => meInfo!.user == user.id;
  bool get applied => applications.any((e) => e.meInfo.user == user.id);
  bool get hasUnivIssue => sameUnivOnly && (user.univ == meInfo!.univ);
}
