import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import '../converter/date_time_converter.dart';
import '../enums.dart';

part 'coin_receipt.g.dart';

@JsonSerializable()
class CoinReceipt {
  String id;
  String user;
  int amount;
  CoinReceiptType type;
  @DateTimeConverter()
  DateTime? createdAt;

  CoinReceipt({this.id = '',
      required this.user,
      required this.amount,
      required this.type}) {
    createdAt ??= DateTime.now();
  }

  factory CoinReceipt.fromJson(Map<String, dynamic> json) => _$CoinReceiptFromJson(json);

  Map<String, dynamic> toJson() => _$CoinReceiptToJson(this);

  bool get isCharge => (type == CoinReceiptType.chargeCoin) || (type == CoinReceiptType.dailyReject) || (type == CoinReceiptType.weeklyReject) || (type == CoinReceiptType.consoleReward) || (type == CoinReceiptType.dailyReward) || (type == CoinReceiptType.dailyCardRefund) || (type == CoinReceiptType.weeklyRefund);
  bool get isConsume => (type == CoinReceiptType.dailyCard) || (type == CoinReceiptType.weeklyMatch);
}
