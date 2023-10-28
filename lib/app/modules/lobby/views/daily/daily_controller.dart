import 'dart:async';

import 'package:get/get.dart';
import 'package:dodohan/app/modules/splash/splash_controller.dart';
import '../../../../../core/base_controller.dart';
import '../../../../../core/services/auth_service.dart';
import '../../../../../routes/app_routes.dart';
import '../../../../data/enums.dart';
import '../../../../data/model/daily_card.dart';
import '../../../../data/model/user.dart';
import '../../../../data/service/daily_card_service/service.dart';

class DailyController extends BaseController {
  final DailyCardService _dailyCardService = DailyCardService();

  final RxList<DailyCard> todayCards = <DailyCard>[].obs;

  User get user => AuthService.to.user.value;
  bool get isFirstChoice => todayCards.every((card) =>
      (card.meStatus == CardStatus.checked) ||
      (card.meStatus == CardStatus.unChecked));

  @override
  Future<void> onInit() async {
    print('DailyController onInit');
    if (user.id == '') {
      Get.put(SplashController());
      await 1.delay();
    }

    todayCards.value = await _dailyCardService.findToday(user.id);
    loading.value = false;
    //todo 오늘 날짜 내 카드들 들고오기
    super.onInit();
  }

  void tapCard(int index, DailyCard dailyCard) async {
    if(todayCards[index].meStatus == CardStatus.unChecked) {
      _dailyCardService.updateMeStatus(dailyCard, CardStatus.checked);
      todayCards[index].meStatus = CardStatus.checked;
      todayCards.refresh();
    } else {
      Get.toNamed(Routes.dailyCard, arguments: {'index': index, 'dailyCard': dailyCard});
    }
  }
}

