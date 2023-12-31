import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import '../converter/date_time_converter.dart';

part 'pg_bill.g.dart';

@JsonSerializable()
class PgBill {
  String id;
  String customer;
  Map<String, dynamic> data;
  @DateTimeConverter()
  DateTime? createdAt;

  PgBill({this.id = '',
      required this.customer,
      required this.data}) {
    createdAt ??= DateTime.now();
  }

  factory PgBill.fromJson(Map<String, dynamic> json) => _$PgBillFromJson(json);

  Map<String, dynamic> toJson() => _$PgBillToJson(this);
}
