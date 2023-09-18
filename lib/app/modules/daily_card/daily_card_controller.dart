import 'package:get/get.dart';
import 'package:stamp_now/app/modules/lobby/views/daily/daily_controller.dart';
import 'package:stamp_now/app/widgets/dialogs/action_dialog.dart';
import '../../../core/base_controller.dart';
import '../../../core/services/auth_service.dart';
import '../../data/enums.dart';
import '../../data/model/daily_card.dart';
import '../../data/model/me_info.dart';
import '../../data/model/user.dart';
import '../../data/service/daily_card_service/service.dart';

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

  Future<void> showConfirmDialog() async {
    Get.dialog(ActionDialog(
        title: '선택하기', text: '하트 3개가 소모됩니다', confirmCallback: () => confirm()));
  }

  Future<void> confirm() async {
    //todo 하트 3개 소모(유저 서비스) + 하트 부족시 스토어 라우팅
    //하기 위해서 5시 30분 요시땡
    // 1. 스토어 페이지 만들기 (30분) - 완료
    // 그런데, 카드사 도입해야 하니까 해당 api 적용 먼저 하자
    // 2. 유저 모델 수정하기
    // 3. 기존 유저 다큐먼트에 함수 만들어 하트 추가 (30분)
    // 4. 소모 시키기 완료 (30분)
    showLoading();
    _dailyCardService.updateMeStatus(dailyCard.value.id, MatchStatus.confirmed);
    hideLoading();

    dailyCard.value.meStatus = MatchStatus.confirmed;
    dailyController.todayCards[cardIndex].meStatus = MatchStatus.confirmed;
    dailyController.todayCards.refresh();
  }

  //
  // Future<void> updateDailyCard() async {
  //   await _dailyCardService.updateOne(dailyCard.value.id!, dailyCard.value);
  //   Get.back();
  //   return;
  // }
}

