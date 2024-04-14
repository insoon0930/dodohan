import 'dart:developer';

import 'package:get/get.dart';
import '../../../../../../core/base_controller.dart';
import '../../../../../../core/services/auth_service.dart';
import '../../../../../../routes/app_routes.dart';
import '../../../../../data/enums.dart';
import '../../../../../data/model/daily_card.dart';
import '../../../../../data/model/user.dart';
import '../../../../../data/service/daily_card_service/service.dart';

class CurrentCardController extends BaseController {
  final DailyCardService _dailyCardService = DailyCardService();
  User get user => AuthService.to.user.value;

  final RxList<DailyCard> sentCards = <DailyCard>[].obs;
  final RxList<DailyCard> receivedCards = <DailyCard>[].obs;

  @override
  Future<void> onInit() async {
    print('CurrentCardController OnInit started');
    sentCards.value = await _dailyCardService.findSent(user.id);
    receivedCards.value = await _dailyCardService.findReceived(user.id);
    isLoading.value = false;
    super.onInit();
  }

  void tapCard(int index, DailyCard dailyCard) async {
    if(dailyCard.meStatus == CardStatus.unChecked) {
      await _dailyCardService.updateMeStatus(dailyCard, CardStatus.checked);
      dailyCard.meStatus = CardStatus.checked;
      receivedCards.refresh();
    } else {
      Get.toNamed(Routes.currentCardItem, arguments: {'index': index, 'dailyCard': dailyCard});
    }
  }
}

