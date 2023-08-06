import 'package:json_annotation/json_annotation.dart';

import '../model/me_info.dart';

class MeInfoConverter implements JsonConverter<MeInfo, Map<String, dynamic>> {
  const MeInfoConverter();

  @override
  MeInfo fromJson(Map<String, dynamic> json) => MeInfo.fromJson(json);

  @override
  Map<String, dynamic> toJson(MeInfo object) => object.toJson();
}