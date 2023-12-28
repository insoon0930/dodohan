import 'package:dodohan/core/services/push_service.dart';
import 'package:dodohan/routes/app_routes.dart';
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

  //내가 들고 들어온 인덱스를 통해서 isFirst를 체크하자
  late final bool isFirstChoice;

  @override
  Future<void> onInit() async {
    print('DailyCardController OnInit started');
    dailyCard.value = Get.arguments['dailyCard'];
    cardIndex = Get.arguments['index'];

    //todo 이거 좀 더 깔끔하게 짤 수 있을듯 (추후에 리스트 3개 되는거 고려해서 확장성 있게)
    //  var chunks = [];
    //   int chunkSize = 2;
    //   for (var i = 0; i < letters.length; i += chunkSize) {
    //     chunks.add(letters.sublist(i, i+chunkSize > letters.length ? letters.length : i + chunkSize));
    //   }
    //   return chunks;
    final List<DailyCard> listA = dailyController.todayCards.sublist(0, 2);
    List<DailyCard> listB = [];
    if (dailyController.todayCards.length > 2) {
      listB = dailyController.todayCards.sublist(2, 4);
    }
    if (cardIndex == 0 || cardIndex == 1) {
      isFirstChoice = listA.every((card) => (card.meStatus == CardStatus.checked) || (card.meStatus == CardStatus.unChecked));
    } else if (cardIndex == 2 || cardIndex == 3) {
      isFirstChoice = listB.every((card) => (card.meStatus == CardStatus.checked) || (card.meStatus == CardStatus.unChecked));
    }
    super.onInit();
  }

  Future<void> showChooseDialog() async {
    //이후에는 추가 선택 과금하는 식으로
    Get.dialog(ActionDialog(title: '오늘의 카드', text: '선택하시겠습니까?', confirmCallback: () => choose()));
  }

  Future<void> showChooseMoreDialog() async {
    //이후에는 추가 선택 과금하는 식으로
    final int costCoin = user.isMan! ? 2 : 1;
    Get.dialog(ActionDialog(
        title: '오늘의 카드', text: '한장 더 선택하시겠습니까?\n하트 $costCoin개가 소모됩니다', confirmCallback: () => chooseMore(costCoin)));
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
    final int rewardCoin = user.isMan! ? 1 : 2;
    await _userService.increaseCoin(user.id, rewardCoin, type: CoinReceiptType.dailyReward);
    AuthService.to.user.update((user) => user!.coin = user.coin + rewardCoin);
    Get.snackbar('하트 지급', '참여 보상으로 하트가 $rewardCoin개 지급되었습니다');
    FcmService.to.sendFcmPush(dailyCard.value.yourInfo!.user!, FcmPushType.dailyConfirmed1st);
  }

  Future<void> chooseMore(int costCoin) async {
    if (user.coin < costCoin) {
      Get.back();
      Get.dialog(ActionDialog(
          title: '하트 부족',
          text: '스토어로 이동하기',
          confirmCallback: () {
            Get.back();
            Get.toNamed(Routes.store);
          }));
      return;
    }

    showLoading();
    _dailyCardService.updateMeStatus(dailyCard.value, CardStatus.confirmed1st);
    hideLoading();
    Get.back();
    dailyCard.value.meStatus = CardStatus.confirmed1st;
    dailyController.todayCards[cardIndex].meStatus = CardStatus.confirmed1st;
    dailyController.todayCards.refresh();

    //유저 하트 갯수 감소 (백, 프론트)
    await _userService.increaseCoin(user.id, -costCoin, type: CoinReceiptType.dailyChooseMore);
    AuthService.to.user.update((user) => user!.coin = user.coin - costCoin);
    Get.snackbar('선택 완료', '오늘의 카드 추가 선택을 완료했습니다');
    FcmService.to.sendFcmPush(dailyCard.value.yourInfo!.user!, FcmPushType.dailyConfirmed1st);
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
