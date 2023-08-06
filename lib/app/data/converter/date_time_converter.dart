import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class DateTimeConverter implements JsonConverter<DateTime, Timestamp> {
  const DateTimeConverter();

  @override
  DateTime fromJson(Timestamp json) => DateTime.fromMicrosecondsSinceEpoch(json.microsecondsSinceEpoch);

  @override
  Timestamp toJson(DateTime object) => Timestamp.fromDate(object);
}