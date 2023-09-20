import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stamp_now/app/widgets/card_container.dart';

import '../../../../../core/theme/buttons.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/fonts.dart';
import '../../../../widgets/appbars/default_appbar.dart';
import 'package:http/http.dart' as http;


class StoreSuccessPage extends StatelessWidget {
  const StoreSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar('결제 성공', hasLeading: false),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('결제 승인 단계입니다',
              style: ThemeFonts.semiBold.getTextStyle(size: 24)),
          const SizedBox(height: 30),
          CardContainer(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                children: [
                  Text('주문번호 : ', style: ThemeFonts.medium.getTextStyle()),
                  Text('${Get.parameters['orderId']}',
                      style: ThemeFonts.medium.getTextStyle()),
                ],
              )),
          ElevatedButton(
              style: BtStyle.standard(color: ThemeColors.blueLight),
              onPressed: () async {
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
                    //todo pgBill 디비 저장, user 디비 업데이트, 로그인 시키고 Get.toNamed
                    //todo 그럼.. userModel 수정하고 기존 모델 업데이트 하고 배포하자 ㅇㅋ
                    //첫 생성시에 5개 주게
                    print('Response: ${response.body}');
                  } else {
                    print('Payment confirmation failed');
                    //todo 로그인 시키고 Get.toNamed
                    print('Response: ${response.body}');
                  }
                } catch (e) {
                  print('Error sending payment confirmation: $e');
                }
              },
              child: const Text('결제 승인하기'))
          // Text('${Get.arguments}'),
          // Text('${Get.arguments['paymentKey']}'),
        ],
      ),
    );
  }
}
