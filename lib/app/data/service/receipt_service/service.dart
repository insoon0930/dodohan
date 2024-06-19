import 'package:dodohan/app/data/model/receipt.dart';
import 'package:dodohan/app/data/service/receipt_service/repository.dart';
import '../../provider/api_service.dart';

class ReceiptService extends ApiService  {
  final ReceiptRepository _receiptRepository = ReceiptRepository();

  ReceiptService._privateConstructor();
  static final ReceiptService _instance = ReceiptService._privateConstructor();
  factory ReceiptService() {
    return _instance;
  }

  //@Get
  Future<List<Receipt>> findAll() async {
    return await _receiptRepository.findAll();
  }

  //@Get
  Future<List<Receipt>> findByBuyerId(String userId) async {
    return await _receiptRepository.findByBuyerId(userId);
  }
}
