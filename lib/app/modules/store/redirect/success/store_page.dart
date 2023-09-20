import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/appbars/default_appbar.dart';

class StoreSuccessPage extends StatelessWidget {

  const StoreSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar('결제 성공'),
      body: Column(
        children: [
          /**
           * todo 여기서 받아온 정보로 결제 승인 진행해줘야해
           * 1. 버튼 만들어서 클릭하면 api 보내서 승인 할 수 있게
           * 2. 성공하면, 디비 업데이트 시켜주고 스토어 화면으로 보내주자
           *    (뒤로도 갈 수 있게 홈화면 지나서 보내주자 ㅇㅅㅇ)
           */
          const Text('결제 성공!!@@'),
          Text('param1: ${Get.parameters}'),
          Text('param2: ${Get.parameters.isEmpty}'),
          // Text('${Get.arguments}'),
          // Text('${Get.arguments['paymentKey']}'),
        ],
      ),
    );
  }
}
