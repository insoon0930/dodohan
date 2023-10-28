import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {

  final RxBool loading = true.obs;

  //todo 기존에 써둔것들 바꿔주기 (급한거 아님)
  void showLoading({bool isDismissible = false}) {
    Get.dialog(const Center(child: CircularProgressIndicator()),
        barrierDismissible: isDismissible);
  }

  void hideLoading() {
    Get.back();
  }

}