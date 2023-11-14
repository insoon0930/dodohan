import 'dart:async';

import 'package:dodohan/app/data/provider/api_service.dart';
import 'package:get/get.dart';
import 'package:dodohan/app/modules/splash/splash_controller.dart';
import '../../../../../core/base_controller.dart';
import '../../../../../core/services/auth_service.dart';
import '../../../../../routes/app_routes.dart';
import '../../../../data/enums.dart';
import '../../../../data/model/daily_card.dart';
import '../../../../data/model/self_introduction.dart';
import '../../../../data/model/user.dart';
import '../../../../data/service/daily_card_service/service.dart';
import '../../../../data/service/self_introduction_service/service.dart';

class SelfIntroductionController extends BaseController {
  // final SelfIntroductionService _dailyCardService = SelfIntroductionService();
  // final RxList<SelfIntroduction> todayCards = <SelfIntroduction>[].obs;
  User get user => AuthService.to.user.value;
  @override
  Future<void> onInit() async {

    super.onInit();
  }

  // void tapCard(int index, DailyCard dailyCard) async {
  //   if(todayCards[index].meStatus == CardStatus.unChecked) {
  //     _dailyCardService.updateMeStatus(dailyCard, CardStatus.checked);
  //     todayCards[index].meStatus = CardStatus.checked;
  //     todayCards.refresh();
  //   } else {
  //     Get.toNamed(Routes.dailyCard, arguments: {'index': index, 'dailyCard': dailyCard});
  //   }
  // }
}

