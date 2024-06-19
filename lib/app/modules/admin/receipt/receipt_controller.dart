import 'package:dodohan/app/data/enums.dart';
import 'package:dodohan/app/data/model/coin_receipt.dart';
import 'package:dodohan/app/data/model/receipt.dart';
import 'package:dodohan/app/data/service/coin_receipt_service/service.dart';
import 'package:dodohan/app/data/service/receipt_service/service.dart';
import 'package:dodohan/app/data/service/user_service/service.dart';
import 'package:dodohan/app/widgets/dialogs/error_dialog.dart';
import 'package:dodohan/core/base_controller.dart';
import 'package:get/get.dart';

import '../../../../core/services/auth_service.dart';
import '../../../../routes/app_routes.dart';
import '../../../data/model/user.dart';

class ReceiptController extends BaseController {
  final UserService userService = UserService();
  final ReceiptService receiptService = ReceiptService();
  final CoinReceiptService coinReceiptService = CoinReceiptService();

  User get user => AuthService.to.user.value;
  final RxString phoneNum = ''.obs;
  final RxInt amount  = 0.obs;
  final RxList<Receipt> receipts = <Receipt>[].obs;
  final RxList<CoinReceipt> coinReceipts = <CoinReceipt>[].obs;

  late Rxn<User> targetUser = Rxn<User>();

  @override
  Future<void> onInit() async {
    if(!AuthService.to.isAdmin) {
      Get.offAllNamed(Routes.loginBy);
      return;
    }
    super.onInit();
  }

  Future<void> findOneByUserId(String phoneNum) async {
    showLoading();
    // - 유저의 현재 코인 수 확인
    targetUser.value = await userService.findOneByPhoneNum('+82${phoneNum.replaceAll('-', '').substring(1)}');
    if(targetUser.value == null) {
      hideLoading();
      Get.dialog(const ErrorDialog(text: '해당 유저가 없음'));
      return;
    }
    // - 최근 리십트 확인(3개)
    receipts.value = await receiptService.findByBuyerId(targetUser.value!.id);
    receipts.refresh();
    // - 최근 코인리십트 확인(10개)
    coinReceipts.value = await coinReceiptService.findByUserId(targetUser.value!.id);
    receipts.refresh();
    hideLoading();
  }

  Future<void> increaseUserCoin(String userId, int amount) async {
    showLoading();
    await userService.increaseCoin(targetUser.value!.id, amount, type: CoinReceiptType.admin);
    hideLoading();
    Get.snackbar('코인 지급', '지급 완료');
  }
}
