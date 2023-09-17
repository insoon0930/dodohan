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

