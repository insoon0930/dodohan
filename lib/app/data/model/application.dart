import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:dodohan/app/data/model/you_info.dart';
import '../converter/date_time_converter.dart';
import '../converter/me_info_converter.dart';
import '../converter/you_info_converter.dart';
import '../info_data.dart';
import 'me_info.dart';

part 'application.g.dart';

@JsonSerializable()
class Application {
  @JsonKey(name: 'id', required: true)
  String id;
  String? user;
  @MeInfoConverter()
  MeInfo? meInfo;
  @YouInfoConverter()
  YouInfo? youInfo;
  @DateTimeConverter()
  DateTime? createdAt;
  bool isRewarded;

  Application(
      {this.id = '',
      this.user,
      this.meInfo,
      this.youInfo,
      this.createdAt,
      this.isRewarded = false}) {
    createdAt ??= DateTime.now();
  }

  factory Application.fromJson(Map<String, dynamic> json) =>
      _$ApplicationFromJson(json);

  Map<String, dynamic> toJson() => _$ApplicationToJson(this);
}
