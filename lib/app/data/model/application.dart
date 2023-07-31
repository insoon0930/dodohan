import 'package:json_annotation/json_annotation.dart';
import 'package:stamp_now/app/data/model/you_info.dart';
import 'me_info.dart';

part 'application.g.dart';

@JsonSerializable()
class Application {
  @JsonKey(name: 'id', required: true)
  String id;
  String? user;
  MeInfo? meInfo;
  YouInfo? youInfo;
  DateTime? createdAt;

  Application({this.id = '', this.user, this.meInfo, this.youInfo, this.createdAt}) {
    createdAt ??= DateTime.now();
  }

  factory Application.fromJson(Map<String, dynamic> json) =>
      _$ApplicationFromJson(json);

  Map<String, dynamic> toJson() => _$ApplicationToJson(this);
}
