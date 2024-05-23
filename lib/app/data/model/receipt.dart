import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import '../converter/date_time_converter.dart';
import '../enums.dart';

part 'receipt.g.dart';

@JsonSerializable()
class Receipt {
  String id;
  String? buyer;
  int? amount;
  bool? isAndroid;
  String? purchaseToken;
  Map? receipt;
  @DateTimeConverter()
  DateTime? createdAt;

  Receipt({this.id = '',
      this.buyer,
      this.amount,
      this.isAndroid,
      this.purchaseToken,
      this.receipt}) {
    createdAt ??= DateTime.now();
  }

  factory Receipt.fromJson(Map<String, dynamic> json) => _$ReceiptFromJson(json);

  Map<String, dynamic> toJson() => _$ReceiptToJson(this);
}
