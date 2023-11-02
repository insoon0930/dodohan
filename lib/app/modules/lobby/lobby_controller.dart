import 'dart:async';
import 'dart:io';

import 'package:dodohan/app/widgets/dialogs/action_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:dodohan/app/modules/lobby/views/daily/daily_controller.dart';
import 'package:dodohan/app/modules/splash/splash_controller.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/services/auth_service.dart';
import '../../data/model/user.dart';
import '../../widgets/dialogs/store_routing_dialog.dart';

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
    if (kIsWeb) {
      Get.dialog(const StoreRoutingDialog());
      return;
    }

    Get.put(DailyController());
    selectedTabIndex(index);
  }
}

