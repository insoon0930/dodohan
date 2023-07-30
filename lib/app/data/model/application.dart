import 'package:json_annotation/json_annotation.dart';
import 'me_info.dart';

part 'application.g.dart';

@JsonSerializable()
class Application {
  @JsonKey(name: 'id', required: true)
  String id;
  MeInfo? meInfo;
  DateTime? createdAt;

  Application({this.id = '', this.meInfo, this.createdAt}) {
    createdAt ??= DateTime.now();
  }

  factory Application.fromJson(Map<String, dynamic> json) =>
      _$ApplicationFromJson(json);

  Map<String, dynamic> toJson() => _$ApplicationToJson(this);
}
