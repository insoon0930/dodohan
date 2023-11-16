import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../core/services/auth_service.dart';
import '../converter/date_time_converter.dart';
import '../converter/me_info_converter.dart';
import '../enums.dart';
import 'me_info.dart';

part 'self_application.g.dart';

@JsonSerializable()
class SelfApplication {
  String id;
  String selfIntroductionId;
  @MeInfoConverter()
  MeInfo meInfo;
  String profileImage, phoneNum;
  SelfApplicationStatus status;
  @DateTimeConverter()
  DateTime? createdAt;

  SelfApplication({this.id = '',
      required this.selfIntroductionId,
      required this.meInfo,
      required this.profileImage,
      required this.phoneNum,
      this.status = SelfApplicationStatus.closed,
      this.createdAt}) {
    createdAt ??= DateTime.now();
  }

  factory SelfApplication.fromJson(json) => _$SelfApplicationFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$SelfApplicationToJson(this);

  int get differenceInDays => DateTime.now().difference(createdAt!).inDays;
}
