import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:dodohan/app/widgets/dialogs/action_dialog.dart';
import '../../../../../../../core/base_controller.dart';
import '../../../../../../../core/services/auth_service.dart';
import '../../../../../../../core/services/push_service.dart';
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
  CardStatus get myStatus => dailyCard.value.myStatus;
  CardStatus get yourStatus => dailyCard.value.yourStatus;
  MeInfo get youInfo => iAmMe ? dailyCard.value.youInfo! : dailyCard.value.meInfo!;
  bool get youMadeAFirstChoice => iAmMe
      ? (dailyCard.value.youStatus == CardStatus.confirmed1st) || (dailyCard.value.youStatus == CardStatus.rejected1st)
      : (dailyCard.value.meStatus == CardStatus.confirmed1st) || (dailyCard.value.meStatus == CardStatus.rejected1st);
  bool get youMadeASecondChoice => iAmMe
      ? (dailyCard.value.youStatus == CardStatus.confirmed2nd) || (dailyCard.value.youStatus == CardStatus.rejected2nd)
      : (dailyCard.value.meStatus == CardStatus.confirmed2nd) || (dailyCard.value.meStatus == CardStatus.rejected2nd);

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
    if(Get.isSnackbarOpen) {
      await Get.closeCurrentSnackbar();
    }
    //1. 하트있는지 확인하고 없으면 부족하다는 다이얼로그 띄우기
    if (user.coin < coin) {
      hideLoading();
      Get.back();
      Get.dialog(ActionDialog(title: '하트 부족', text: '충전하러 가시겠습니까?', confirmCallback: () {
        Get.back();
        return Get.toNamed(Routes.store);
      }));
      return;
    }
    //2. 데일리매치 상태 업데이트 (백, 프론트)
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
      currentCardController.receivedCards.refresh();
    }
    //3. 유저 하트 갯수 차감 (백, 프론트)
    //백
    await _userService.increaseCoin(user.id, -coin, type: CoinReceiptType.dailyCard);
    //프론트
    AuthService.to.user.update((user) => user!.coin = user.coin - coin);
    hideLoading();
    Get.back();

    if (dailyCard.value.yourStatus == CardStatus.confirmed2nd) {
      Get.snackbar('매칭 성공', '상대방의 전화번호를 확인하세요!');
    } else if (dailyCard.value.yourStatus == CardStatus.rejected2nd) {
      Get.snackbar('매칭 실패', '상대방이 거절한 상태입니다');
    }
    Get.snackbar('수락 완료', '상대방의 선택을 기다려주세요');

    //fcm push
    FcmService.to.sendFcmPush(dailyCard.value.yourInfo!.user!,
        cardStatus == CardStatus.confirmed1st ? FcmPushType.dailyDone1st : FcmPushType.dailyDone2nd);
  }

  Future<void> reject({required CardStatus cardStatus}) async {
    showLoading();
    if(Get.isSnackbarOpen) {
      await Get.closeCurrentSnackbar();
    }
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
    final int rewardCoin = user.isMan! ? 1 : 2;
    //백
    await _userService.increaseCoin(user.id, rewardCoin, type: CoinReceiptType.dailyReject);
    //프론트
    AuthService.to.user.update((user) => user!.coin = user.coin + rewardCoin);
    hideLoading();
    Get.back();
    Get.snackbar('하트 지급', '참여 보상으로 하트가 $rewardCoin개 지급되었습니다');

    //fcm push
    FcmService.to.sendFcmPush(dailyCard.value.yourInfo!.user!,
        cardStatus == CardStatus.rejected1st ? FcmPushType.dailyDone1st : FcmPushType.dailyDone2nd);
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

