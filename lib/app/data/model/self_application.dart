import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../core/services/auth_service.dart';
import '../converter/date_time_converter.dart';
import '../converter/me_info_converter.dart';
import '../enums.dart';
import 'me_info.dart';

part 'self_application.g.dart';

//이거 컬렉션 있긴해야겠다 //나중에 따로 내꺼만 조회한다던가 해야하니께
@JsonSerializable()
class SelfApplication {
  String id;
  @MeInfoConverter()
  MeInfo? meInfo;
  String profileImage, phoneNum;
  SelfApplicationStatus status;
  @DateTimeConverter()
  DateTime? createdAt;

  SelfApplication({this.id = '',
      this.meInfo,
      this.profileImage = '',
      this.phoneNum = '',
      this.status = SelfApplicationStatus.closed,
      this.createdAt}) {
    createdAt ??= DateTime.now();
  }

  factory SelfApplication.fromJson(json) => _$SelfApplicationFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$SelfApplicationToJson(this);

  int get differenceInDays => DateTime.now().difference(createdAt!).inDays;
}
