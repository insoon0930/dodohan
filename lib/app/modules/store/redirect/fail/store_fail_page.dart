import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stamp_now/app/modules/store/redirect/fail/store_fail_controller.dart';

import '../../../../../core/theme/buttons.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/fonts.dart';
import '../../../../widgets/appbars/default_appbar.dart';


class StoreFailPage extends GetView<StoreFailController> {
  const StoreFailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar('결제 실패', hasLeading: false),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('결제를 완료할 수 없습니다',
              style: ThemeFonts.semiBold.getTextStyle(size: 24)),
          const SizedBox(height: 30),
          ElevatedButton(
              style: BtStyle.standard(color: ThemeColors.blueLight),
              onPressed: () => controller.confirm(),
              child: const Text('앱으로 돌아가기'))
          // Text('${Get.arguments}'),
          // Text('${Get.arguments['paymentKey']}'),
        ],
      ).paddingSymmetric(horizontal: 16),
    );
  }
}
