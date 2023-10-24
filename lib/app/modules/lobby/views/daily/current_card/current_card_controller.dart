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
    super.onInit();
  }

  void tapCard(int index, DailyCard dailyCard) async {
    if(dailyCard.meStatus == CardStatus.unChecked) {
      _dailyCardService.updateMeStatus(dailyCard.id, CardStatus.checked);
      dailyCard.meStatus = CardStatus.checked;
      receivedCards.refresh();
    } else {
      Get.toNamed(Routes.currentCardItem, arguments: {'dailyCard': dailyCard});
    }
  }
  //
  // Future<void> showChooseDialog() async {
  //   //todo 이후에는 추가 선택 과금하는 식으로
  //   Get.dialog(ActionDialog(
  //       title: '오늘의 카드', text: '선택하시겠습니까?', confirmCallback: () => choose()));
  // }
  //
  // Future<void> choose() async {
  //   showLoading();
  //   _dailyCardService.updateMeStatus(dailyCard.value.id, CardStatus.confirmed1st);
  //   hideLoading();
  //
  //   dailyCard.value.meStatus = CardStatus.confirmed1st;
  //   dailyController.todayCards[cardIndex].meStatus = CardStatus.confirmed1st;
  //   dailyController.todayCards.refresh();
  // }
  //
  // //
  // // Future<void> updateDailyCard() async {
  // //   await _dailyCardService.updateOne(dailyCard.value.id!, dailyCard.value);
  // //   Get.back();
  // //   return;
  // // }
}

