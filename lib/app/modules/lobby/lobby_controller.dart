import 'dart:async';

import 'package:get/get.dart';
import 'package:dodohan/app/modules/lobby/views/daily/daily_controller.dart';
import 'package:dodohan/app/modules/splash/splash_controller.dart';
import '../../../core/services/auth_service.dart';
import '../../data/model/user.dart';

class LobbyController extends GetxController {

  final RxInt selectedTabIndex = 0.obs;

  User get user => AuthService.to.user.value;

  @override
  Future<void> onInit() async {
    if (user.id == '') {
      Get.put(SplashController());
      await 1.delay();
    }
    super.onInit();
  }

  void changeIndex(int index) {
    Get.put(DailyController());
    selectedTabIndex(index);
  }
}

