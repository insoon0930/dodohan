import 'package:json_annotation/json_annotation.dart';
import '../model/you_info.dart';

class YouInfoConverter implements JsonConverter<YouInfo, Map<String, dynamic>> {
  const YouInfoConverter();

  @override
  YouInfo fromJson(Map<String, dynamic> json) => YouInfo.fromJson(json);

  @override
  Map<String, dynamic> toJson(YouInfo object) => object.toJson();
}