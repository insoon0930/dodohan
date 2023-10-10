import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dodohan/app/data/service/coin_receipt_service/repository.dart';
import 'package:dodohan/app/data/service/daily_card_service/repository.dart';
import 'package:dodohan/app/data/service/identity_service/repository.dart';
import 'package:dodohan/app/data/service/pg_bill_service/repository.dart';
import '../../enums.dart';
import '../../model/coin_receipt.dart';
import '../../model/daily_card.dart';
import '../../model/identity.dart';
import '../../model/me_info.dart';
import '../../model/pg_bill.dart';
import '../../model/you_info.dart';
import '../../provider/api_service.dart';
import '../me_info_service/repository.dart';
import '../user_service/repository.dart';
import '../you_info_service/repository.dart';

class CoinReceiptService extends ApiService  {
  final CoinReceiptRepository _coinReceiptRepository = CoinReceiptRepository();

  CoinReceiptService._privateConstructor();
  static final CoinReceiptService _instance = CoinReceiptService._privateConstructor();
  factory CoinReceiptService() {
    return _instance;
  }

  //@Post
  Future<void> create(CoinReceipt coinReceipt) async {
    return await _coinReceiptRepository.create(coinReceipt);
  }

  //@Get
  Future<List<CoinReceipt>> find(String user) async {
    return await _coinReceiptRepository.find(user);
  }
}
