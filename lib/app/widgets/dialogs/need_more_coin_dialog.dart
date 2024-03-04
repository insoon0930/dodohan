import 'package:dodohan/app/widgets/dialogs/action_dialog.dart';
import 'package:dodohan/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NeedMoreCoinDialog extends StatelessWidget {
  const NeedMoreCoinDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ActionDialog(
        title: '하트 부족',
        text: '스토어로 이동하기',
        confirmCallback: () {
          Get.back();
          return Get.toNamed(Routes.store);
        });
  }
}
