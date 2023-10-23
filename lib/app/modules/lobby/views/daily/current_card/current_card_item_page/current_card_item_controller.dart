import 'package:get/get.dart';
import 'package:dodohan/app/modules/lobby/views/daily/daily_controller.dart';
import 'package:dodohan/app/widgets/dialogs/action_dialog.dart';
import '../../../../../../../core/base_controller.dart';
import '../../../../../../../core/services/auth_service.dart';
import '../../../../../../data/enums.dart';
import '../../../../../../data/model/daily_card.dart';
import '../../../../../../data/model/me_info.dart';
import '../../../../../../data/model/user.dart';
import '../../../../../../data/service/daily_card_service/service.dart';
import '../current_card_controller.dart';

class CurrentCardItemController extends BaseController {
  final DailyCardService _dailyCardService = DailyCardService();
  final CurrentCardController currentCardController = Get.find();

  final Rx<DailyCard> dailyCard = DailyCard().obs;
  MeInfo get youInfo => dailyCard.value.youInfo!;
  User get user => AuthService.to.user.value;
  CardStatus get meStatus => dailyCard.value.meStatus;
  CardStatus get youStatus => dailyCard.value.youStatus;
  bool get youMadeAFirstChoice => (dailyCard.value.youStatus == CardStatus.confirmed1st) || (dailyCard.value.youStatus == CardStatus.rejected1st);

  @override
  Future<void> onInit() async {
    print('CurrentCardItemController OnInit started');
    dailyCard.value = Get.arguments['dailyCard'];
    super.onInit();
  }

  Future<void> showChooseDialog() async {
    //todo 이후에는 추가 선택 과금하는 식으로
    Get.dialog(ActionDialog(
        title: '오늘의 카드', text: '선택하시겠습니까?', confirmCallback: () => choose()));
  }

  Future<void> choose() async {
    showLoading();
    _dailyCardService.updateMeStatus(dailyCard.value.id, CardStatus.confirmed1st);
    hideLoading();
    Get.back();
    dailyCard.value.meStatus = CardStatus.confirmed1st;
    // dailyController.todayCards[cardIndex].meStatus = CardStatus.confirmed1st;
    //todo 어디껀지 파악하도록 해당 변수 받아오고 업데이트도 해줘야할듯?
    currentCardController.sentCards.refresh();
    currentCardController.receivedCards.refresh();
  }

  //
  // Future<void> updateDailyCard() async {
  //   await _dailyCardService.updateOne(dailyCard.value.id!, dailyCard.value);
  //   Get.back();
  //   return;
  // }
}

