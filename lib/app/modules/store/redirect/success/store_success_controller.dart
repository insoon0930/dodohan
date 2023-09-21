import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../../../core/services/auth_service.dart';
import '../../../../../routes/app_routes.dart';
import '../../../../data/model/pg_bill.dart';
import '../../../../data/service/pg_bill_service/service.dart';
import '../../../../data/service/user_service/service.dart';

class StoreSuccessController extends GetxController {
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
    /**
     * todo 여기서 받아온 정보로 결제 승인 진행해줘야해
     * 1. 버튼 만들어서 클릭하면 api 보내서 승인 할 수 있게
     * 2. 성공하면, 디비 업데이트 시켜주고 스토어 화면으로 보내주자
     *    (뒤로도 갈 수 있게 홈화면 지나서 보내주자 ㅇㅅㅇ)
     *    curl --request POST \
        --url https://api.tosspayments.com/v1/payments/confirm \
        --header 'Authorization: Basic dGVzdF9za196WExrS0V5cE5BcldtbzUwblgzbG1lYXhZRzVSOg==' \
        --header 'Content-Type: application/json' \
        --header 'Idempotency-Key: a6a498c4-6f61-4183-a2ff-80176e69a067' \
        --data '{"paymentKey":"5zJ4xY7m0kODnyRpQWGrN2xqGlNvLrKwv1M9ENjbeoPaZdL6","orderId":"a4CWyWY5m89PNh7xJwhk1","amount":15000}'
     */
    final url = Uri.parse('https://api.tosspayments.com/v1/payments/confirm');

    // Replace with your actual credentials and data
    final headers = {
      'Authorization': 'Basic dGVzdF9za196WExrS0V5cE5BcldtbzUwblgzbG1lYXhZRzVSOg==',
      'Content-Type': 'application/json',
      'Idempotency-Key': 'a6a498c4-6f61-4183-a2ff-80176e69a067',
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
        print('Response: ${response.body}');
        _onSucceeded(jsonDecode(response.body));

      } else {
        print('Payment confirmation failed');
        print('Response: ${response.body}');
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
    await _userService.increaseCoin(AuthService.to.user.value.id, coin);

    AuthService.to.user.update((user) => user!.coin = user.coin + coin);
    Get.offAllNamed(Routes.lobby);
  }

  Future<void> _onFailed() async {
    Get.offAllNamed(Routes.lobby);
    Get.snackbar('결제 실패', '결제 승인에 실패했습니다.');
  }
}

