import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import '../converter/date_time_converter.dart';
import '../enums.dart';

part 'coin_receipt.g.dart';

@JsonSerializable()
class CoinReceipt {
  String id;
  String customer;
  int amount;
  CoinReceiptType type;
  Map<String, dynamic>? data;
  @DateTimeConverter()
  DateTime? createdAt;

  CoinReceipt({this.id = '',
      required this.customer,
      required this.amount,
      required this.type,
      this.data}) {
    createdAt ??= DateTime.now();
  }

  factory CoinReceipt.fromJson(Map<String, dynamic> json) => _$CoinReceiptFromJson(json);

  Map<String, dynamic> toJson() => _$CoinReceiptToJson(this);

  bool get isCharge => (type == CoinReceiptType.chargeCoin) || (type == CoinReceiptType.rejectReward) || (type == CoinReceiptType.consoleReward);
  bool get isConsume => (type == CoinReceiptType.dailyCard) || (type == CoinReceiptType.weeklyMatch);
}
