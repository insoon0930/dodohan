import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../../../core/base_controller.dart';
import '../../../../../core/services/auth_service.dart';
import '../../../../../routes/app_routes.dart';
import '../../../../data/enums.dart';
import '../../../../data/model/pg_bill.dart';
import '../../../../data/service/pg_bill_service/service.dart';
import '../../../../data/service/user_service/service.dart';

class StoreSuccessController extends BaseController {
  final UserService _userService = UserService();
  final PgBillService _pgBillService = PgBillService();
  // final MeInfoService _meInfoService = MeInfoService();
  //
  // Rx<MeInfo> meInfo = MeInfo().obs;
  //
  // User get user => AuthService.to.user.value;
  //
  @override
  Future<void> onInit() async {
    print('StoreSuccessController onInit');
    final prefs = await SharedPreferences.getInstance();
    String uid = prefs.getString('uid')!;
    AuthService.to.user.value = (await _userService.findOneByUid(uid))!;
    super.onInit();
  }

  Future<void> confirm() async {
    showLoading();
    final url = Uri.parse('https://api.tosspayments.com/v1/payments/confirm');

    //todo 시크릿키 변경
    final headers = {
      'Authorization': 'Basic dGVzdF9za19qRXhQZUpXWVZRbFI5N2c1N2J2MzQ5UjVndk5MOg==',
      'Content-Type': 'application/json',
    };

    final body = jsonEncode({
      'paymentKey': Get.parameters['paymentKey'],
      'orderId': Get.parameters['orderId'],
      'amount': Get.parameters['amount'],
    });

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        print('Payment confirmation success');
        _onSucceeded(json.decode(utf8.decode(response.bodyBytes)));
      } else {
        print('Payment confirmation failed');
        _onFailed();
      }
    } catch (e) {
      print('Error sending payment confirmation: $e');
    }
  }

  Future<void> _onSucceeded(Map<String, dynamic> pgData) async {
    await _pgBillService.create(PgBill(customer: AuthService.to.user.value.id, data: pgData));

    final String orderName = pgData['orderName'];
    final int startIndex = orderName.indexOf('하트 ') + '하트 '.length;
    final int endIndex =  orderName.indexOf('개');
    final String extractedString = orderName.substring(startIndex, endIndex);
    final int coin = int.parse(extractedString);
    await _userService.increaseCoin(AuthService.to.user.value.id, coin, type: CoinReceiptType.chargeCoin);

    hideLoading();
    AuthService.to.user.update((user) => user!.coin = user.coin + coin);
    Get.offAllNamed(Routes.lobby);
    Get.snackbar('결제 성공!', '$coin 하트가 지급되었습니다');
  }

  Future<void> _onFailed() async {
    Get.offAllNamed(Routes.lobby);
    Get.snackbar('결제 실패', '결제 승인에 실패했습니다.');
  }
}

