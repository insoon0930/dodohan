import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_app_review/in_app_review.dart';

import 'action_dialog.dart';

class ForceUpdateDialog extends StatelessWidget {
  const ForceUpdateDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ActionDialog(
      title: '업데이트 알림',
      text: '중요한 변경사항으로 인해 업데이트를\n해야만 앱을 이용할 수 있습니다',
      confirmCallback: () async {
        Get.back();
        final InAppReview inAppReview = InAppReview.instance;
        if (await inAppReview.isAvailable()) {
          inAppReview.openStoreListing(appStoreId: '6468897896');
        }
      },
      buttonText: '업데이트'.tr,
    );
  }
}
