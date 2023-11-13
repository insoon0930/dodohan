import 'dart:async';
import 'dart:io';

import 'package:dodohan/app/modules/lobby/views/self_introduction/self_introduction_controller.dart';
import 'package:dodohan/app/modules/lobby/widgets/dialogs/how_to_use_daily.dart';
import 'package:dodohan/app/modules/lobby/widgets/dialogs/how_to_use_self_introduction.dart';
import 'package:dodohan/app/modules/lobby/widgets/dialogs/how_to_use_weekly.dart';
import 'package:dodohan/app/widgets/dialogs/action_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dodohan/app/modules/lobby/views/daily/daily_controller.dart';
import 'package:dodohan/app/modules/splash/splash_controller.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/services/auth_service.dart';
import '../../../core/theme/buttons.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/fonts.dart';
import '../../data/info_data.dart';
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
    selectedTabIndex.value = index;
    if(selectedTabIndex.value == 1 && !Get.isRegistered<DailyController>()) {
      Get.put(DailyController());
    }
    if(selectedTabIndex.value == 2 && !Get.isRegistered<SelfIntroductionController>()) {
      Get.put(SelfIntroductionController());
    }
  }

  void showHowToUseWeekly() {
    Get.dialog(const HowToUseWeeklyDialog());
  }

  void showHowToUseDaily() {
    Get.dialog(const HowToUseDailyDialog());
  }

  void showHowToUseSelfIntroductionDialog() {
    Get.dialog(const HowToUseSelfIntroductionDialog());
  }
}

