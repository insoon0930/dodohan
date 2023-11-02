import 'package:get/get.dart';
import 'package:dodohan/app/modules/lobby/views/daily/daily_controller.dart';
import 'package:dodohan/app/widgets/dialogs/action_dialog.dart';
import '../../../../../../core/base_controller.dart';
import '../../../../../../core/services/auth_service.dart';
import '../../../../../data/enums.dart';
import '../../../../../data/model/daily_card.dart';
import '../../../../../data/model/me_info.dart';
import '../../../../../data/model/user.dart';
import '../../../../../data/service/daily_card_service/service.dart';
import '../../../../../data/service/user_service/service.dart';

class DailyCardController extends BaseController {
  final DailyCardService _dailyCardService = DailyCardService();
  final UserService _userService = UserService();
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
    _dailyCardService.updateMeStatus(dailyCard.value, CardStatus.confirmed1st);
    hideLoading();
    Get.back();
    dailyCard.value.meStatus = CardStatus.confirmed1st;
    dailyController.todayCards[cardIndex].meStatus = CardStatus.confirmed1st;
    dailyController.todayCards.refresh();

    //유저 하트 갯수 증가 (백, 프론트)
    const int rewardCoin = 1;
    await _userService.increaseCoin(user.id, rewardCoin);
    AuthService.to.user.update((user) => user!.coin = user.coin + rewardCoin);
    Get.snackbar('하트 지급', '참여 보상으로 하트가 1개 지급되었습니다');
  }

  Future<void> block() async {
    showLoading();
    await _dailyCardService.block(dailyCard.value);
    hideLoading();
    Get.back();
    dailyCard.value.meBlockedYou = true;
    dailyController.todayCards[cardIndex].meBlockedYou = true;
    dailyController.todayCards.refresh();
    Get.back(); // 카드에서 나가기
  }
}

