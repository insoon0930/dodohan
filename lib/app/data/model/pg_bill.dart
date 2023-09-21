import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:stamp_now/app/data/model/you_info.dart';
import '../converter/date_time_converter.dart';
import '../converter/me_info_converter.dart';
import '../enums.dart';
import 'me_info.dart';

part 'pg_bill.g.dart';

@JsonSerializable()
class PgBill {
  String id;
  String customer;
  Map data;
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
