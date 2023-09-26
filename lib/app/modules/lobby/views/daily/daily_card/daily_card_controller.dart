import 'package:get/get.dart';
import 'package:stamp_now/app/modules/lobby/views/daily/daily_controller.dart';
import 'package:stamp_now/app/widgets/dialogs/action_dialog.dart';
import '../../../../../../core/base_controller.dart';
import '../../../../../../core/services/auth_service.dart';
import '../../../../../data/enums.dart';
import '../../../../../data/model/daily_card.dart';
import '../../../../../data/model/me_info.dart';
import '../../../../../data/model/user.dart';
import '../../../../../data/service/daily_card_service/service.dart';

class DailyCardController extends BaseController {
  final DailyCardService _dailyCardService = DailyCardService();
  final DailyController dailyController = Get.find();

  final Rx<DailyCard> dailyCard = DailyCard().obs;
  late final int cardIndex;
  MeInfo get youInfo => dailyCard.value.youInfo!;
  User get user => AuthService.to.user.value;

  @override
  Future<void> onInit() async {
    print('DailyCardController OnInit started');
    dailyCard.value = Get.arguments['dailyCard'];
    cardIndex = Get.arguments['index'];
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

    dailyCard.value.meStatus = CardStatus.confirmed1st;
    dailyController.todayCards[cardIndex].meStatus = CardStatus.confirmed1st;
    dailyController.todayCards.refresh();
  }

  //
  // Future<void> updateDailyCard() async {
  //   await _dailyCardService.updateOne(dailyCard.value.id!, dailyCard.value);
  //   Get.back();
  //   return;
  // }
}

