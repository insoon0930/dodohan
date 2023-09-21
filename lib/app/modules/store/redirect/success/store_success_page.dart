import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stamp_now/app/modules/store/redirect/success/store_success_controller.dart';
import 'package:stamp_now/app/widgets/card_container.dart';

import '../../../../../core/theme/buttons.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/fonts.dart';
import '../../../../widgets/appbars/default_appbar.dart';


class StoreSuccessPage extends GetView<StoreSuccessController> {
  const StoreSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar('인증 성공', hasLeading: false),
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
              onPressed: () => controller.confirm(),
              child: const Text('결제 승인하기'))
          // Text('${Get.arguments}'),
          // Text('${Get.arguments['paymentKey']}'),
        ],
      ),
    );
  }
}
