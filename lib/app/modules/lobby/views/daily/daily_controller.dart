import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stamp_now/app/data/model/image_update_request.dart';
import 'package:stamp_now/app/modules/daily_card/daily_card_page.dart';
import 'package:stamp_now/app/modules/splash/splash_controller.dart';
import 'package:stamp_now/app/widgets/dialogs/application_dialog.dart';
import 'package:stamp_now/app/widgets/dialogs/match/final_decision_dialog.dart';
import 'package:stamp_now/app/widgets/dialogs/match/match_success_dialog.dart';
import 'package:stamp_now/core/utils/time_utility.dart';
import '../../../../../core/services/auth_service.dart';
import '../../../../../core/theme/fonts.dart';
import '../../../../../core/utils/utility.dart';
import '../../../../../routes/app_routes.dart';
import '../../../../data/enums.dart';
import '../../../../data/model/daily_card.dart';
import '../../../../data/model/me_info.dart';
import '../../../../data/model/match.dart';
import '../../../../data/model/user.dart';
import '../../../../data/model/you_info.dart';
import '../../../../data/provider/storage_service.dart';
import '../../../../data/service/application_service/service.dart';
import '../../../../data/service/daily_card_service/service.dart';
import '../../../../data/service/image_update_request_service/service.dart';
import '../../../../data/service/match_service/service.dart';
import '../../../../data/service/me_info_service/service.dart';
import '../../../../data/service/user_service/service.dart';
import '../../../../data/service/you_info_service/service.dart';
import '../../../../widgets/dialogs/action_dialog.dart';
import '../../../../widgets/dialogs/error_dialog.dart';
import '../../../../widgets/dialogs/match/decision_waiting_dialog.dart';
import '../../../../widgets/dialogs/select/select_dialog.dart';
import '../../../../widgets/dialogs/select/select_dialog_item.dart';

class DailyController extends GetxController {
  final DailyCardService _dailyCardService = DailyCardService();

  final RxList<DailyCard> todayCards = <DailyCard>[].obs;

  User get user => AuthService.to.user.value;

  @override
  Future<void> onInit() async {
    print('DailyController onInit');
    if (user.id == '') {
      Get.put(SplashController());
      await 1.delay();
    }

    todayCards.value = await _dailyCardService.findToday(user.id);
    //todo 오늘 날짜 내 카드들 들고오기
    super.onInit();
  }

  void tapCard(int index, DailyCard dailyCard) async {
    if(todayCards[index].meStatus == MatchStatus.unChecked) {
      todayCards[index].meStatus = MatchStatus.checked;
      todayCards.refresh();
    } else {
      Get.toNamed(Routes.dailyCard, arguments: dailyCard);
    }
  }
}

