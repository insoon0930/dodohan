import 'package:json_annotation/json_annotation.dart';

import '../model/self_application.dart';

class SelfApplicationConverter implements JsonConverter<SelfApplication, Map<String, dynamic>> {
  const SelfApplicationConverter();

  @override
  SelfApplication fromJson(Map<String, dynamic> json) => SelfApplication.fromJson(json);

  @override
  Map<String, dynamic> toJson(SelfApplication object) => object.toJson();
}