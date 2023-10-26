import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:dodohan/app/widgets/dialogs/action_dialog.dart';
import '../../../../../../../core/base_controller.dart';
import '../../../../../../../core/services/auth_service.dart';
import '../../../../../../../routes/app_routes.dart';
import '../../../../../../data/enums.dart';
import '../../../../../../data/model/daily_card.dart';
import '../../../../../../data/model/me_info.dart';
import '../../../../../../data/model/user.dart';
import '../../../../../../data/service/daily_card_service/service.dart';
import '../../../../../../data/service/user_service/service.dart';
import '../current_card_controller.dart';

class CurrentCardItemController extends BaseController {
  final DailyCardService _dailyCardService = DailyCardService();
  final CurrentCardController currentCardController = Get.find();
  final UserService _userService = UserService();


  final Rx<DailyCard> dailyCard = DailyCard().obs;
  late final int cardIndex;

  User get user => AuthService.to.user.value;
  bool get iAmMe => dailyCard.value.iAmMe;
  CardStatus get meStatus => iAmMe ? dailyCard.value.meStatus : dailyCard.value.youStatus;
  CardStatus get youStatus => iAmMe ? dailyCard.value.youStatus : dailyCard.value.meStatus;
  MeInfo get youInfo => iAmMe ? dailyCard.value.youInfo! : dailyCard.value.meInfo!;
  bool get youMadeAFirstChoice => iAmMe
      ? (dailyCard.value.youStatus == CardStatus.confirmed1st) || (dailyCard.value.youStatus == CardStatus.rejected1st)
      : (dailyCard.value.meStatus == CardStatus.confirmed1st) || (dailyCard.value.meStatus == CardStatus.rejected1st);

  @override
  Future<void> onInit() async {
    print('CurrentCardItemController OnInit started');
    dailyCard.value = Get.arguments['dailyCard'];
    cardIndex = Get.arguments['index'];
    super.onInit();
  }

  Future<void> copyPhoneNum(String phoneNum) async {
    await Clipboard.setData(ClipboardData(text: phoneNum));
    Get.snackbar('전화번호', '클립보드에 저장 완료');
  }

  Future<void> confirm({required int coin, required CardStatus cardStatus}) async {
    showLoading();
    //1. 하트있는지 확인하고 없으면 부족하다는 다이얼로그 띄우기
    if (user.coin < coin) {
      Get.dialog(ActionDialog(title: '하트 부족', text: '충전하러 가시겠습니까?', confirmCallback: () => Get.to(Routes.store)));
    }
    //2. 있으면 데일리매치 상태 업데이트 (백, 프론트)
    if (iAmMe) {
      //백 //todo 아 이게 오늘자 껄로 업데이트하네 함수 따뤄둬야할 듯? 최근 삼일날짜 중에 찾아서 업데이트하는 식으로
      await _dailyCardService.updateMeStatus(dailyCard.value, cardStatus);
      //프론트
      dailyCard.update((val) => val!.meStatus = cardStatus);
      currentCardController.sentCards[cardIndex].meStatus = cardStatus;
    } else {
      //백
      await _dailyCardService.updateYouStatus(dailyCard.value, cardStatus);
      //프론트
      dailyCard.update((val) => val!.youStatus = cardStatus);
      currentCardController.receivedCards[cardIndex].youStatus = cardStatus;
    }
    //3. 유저 하트 갯수 차감 (백, 프론트)
    //백
    await _userService.increaseCoin(user.id, -coin);
    //프론트
    AuthService.to.user.update((user) => user!.coin = user.coin - coin);
    hideLoading();
    Get.back();
    Get.snackbar('수락 완료', '상대방의 선택을 기다려주세요');
  }

  Future<void> reject({required CardStatus cardStatus}) async {
    showLoading();
    //1. 데일리매치 상태 업데이트 (백, 프론트)
    if (iAmMe) {
      //백
      await _dailyCardService.updateMeStatus(dailyCard.value, cardStatus);
      //프론트
      dailyCard.update((val) => val!.meStatus = cardStatus);
      currentCardController.sentCards[cardIndex].meStatus = cardStatus;
      currentCardController.sentCards.refresh();
    } else {
      //백
      await _dailyCardService.updateYouStatus(dailyCard.value, cardStatus);
      //프론트
      dailyCard.update((val) => val!.youStatus = cardStatus);
      currentCardController.receivedCards[cardIndex].youStatus = cardStatus;
      currentCardController.sentCards.refresh();
    }
    //2. 유저 하트 갯수 증가 (백, 프론트)
    const int rewardCoin = 1;
    //백
    await _userService.increaseCoin(user.id, rewardCoin);
    //프론트
    AuthService.to.user.update((user) => user!.coin = user.coin + rewardCoin);
    hideLoading();
    Get.back();
    Get.snackbar('하트 지급', '참여 보상으로 하트가 1개 지급되었습니다');
  }

  Future<void> block() async {
    showLoading();
    await _dailyCardService.block(dailyCard.value);
    hideLoading();
    if (iAmMe) {
      currentCardController.sentCards.removeAt(cardIndex);
    } else {
      currentCardController.receivedCards.removeAt(cardIndex);
    }
    Get.back(); // 카드에서 나가기
  }
}

