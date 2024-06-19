import 'package:get/get.dart';

import '../../../../core/base_controller.dart';
import '../../../../core/services/auth_service.dart';
import '../../../data/model/coin_receipt.dart';
import '../../../data/model/user.dart';
import '../../../data/service/coin_receipt_service/service.dart';

class StoreHistoryController extends BaseController {
  final CoinReceiptService _coinReceiptService = CoinReceiptService();

  //todo coinReceipt 를 하나 만들어서 운영하자 pg 생성시에 충전으로 하나 만들고@@@ 코인 사용시에 하나 만들고@@@
  final RxList<CoinReceipt> coinReceipts = <CoinReceipt>[].obs;
  User get user => AuthService.to.user.value;

  @override
  Future<void> onInit() async {
    coinReceipts.value = await _coinReceiptService.findByUserId(user.id);
    super.onInit();
  }
  //
  // Future<void> updateYouInfo() async {
  //   await _youInfoService.updateOne(youInfo.value.id!, youInfo.value);
  //   Get.back();
  //   return;
  // }
}

