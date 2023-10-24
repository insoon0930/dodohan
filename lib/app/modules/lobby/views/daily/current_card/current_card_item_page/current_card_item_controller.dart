import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:dodohan/app/modules/lobby/views/daily/daily_controller.dart';
import 'package:dodohan/app/widgets/dialogs/action_dialog.dart';
import '../../../../../../../core/base_controller.dart';
import '../../../../../../../core/services/auth_service.dart';
import '../../../../../../../core/utils/utility.dart';
import '../../../../../../../routes/app_routes.dart';
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

  User get user => AuthService.to.user.value;
  bool get iAmME => user.id == dailyCard.value.meInfo!.user;
  CardStatus get meStatus => iAmME ? dailyCard.value.meStatus : dailyCard.value.youStatus;
  CardStatus get youStatus => iAmME ? dailyCard.value.youStatus : dailyCard.value.meStatus;
  MeInfo get youInfo => iAmME ? dailyCard.value.youInfo! : dailyCard.value.meInfo!;
  bool get youMadeAFirstChoice => iAmME
      ? (dailyCard.value.youStatus == CardStatus.confirmed1st) || (dailyCard.value.youStatus == CardStatus.rejected1st)
      : (dailyCard.value.meStatus == CardStatus.confirmed1st) || (dailyCard.value.meStatus == CardStatus.rejected1st);

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

  Future<void> copyPhoneNum(String phoneNum) async {
    await Clipboard.setData(ClipboardData(text: phoneNum));
    Get.snackbar('전화번호', '클립보드에 저장 완료');
  }

  Future<void> firstConfirm() async {
    ///1. 하트있는지 확인하고 없으면 부족하다는 다이얼로그 띄우기
    if (user.coin < 1) {
      Get.dialog(ActionDialog(title: '하트 부족', text: '충전하러 가시겠습니까?', confirmCallback: () => Get.to(Routes.store)));
    }
    ///2. 있으면 데일리매치 상태 업데이트 (백, 프론트)
    ///3. 유저 하트 갯수 차감 (백, 프론트)
  }

  Future<void> secondConfirm() async {}

  Future<void> firstReject() async {
    ///1. 데일리매치 상태 업데이트 (백, 프론트)
    ///2. 유저 하트 갯수 증가 (백, 프론트)
  }

  Future<void> secondReject() async {}
}

