import 'package:dodohan/app/data/service/coin_receipt_service/repository.dart';
import '../../model/coin_receipt.dart';
import '../../provider/api_service.dart';

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
  Future<List<CoinReceipt>> findByUserId(String userId) async {
    return await _coinReceiptRepository.findByUserId(userId);
  }

  //@Get
  Future<List<CoinReceipt>> findAllDailyRewards() async {
    return await _coinReceiptRepository.findAllDailyRewards();
  }
}
