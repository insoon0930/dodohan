import 'package:dodohan/app/data/enums.dart';
import 'package:dodohan/app/data/model/me_info.dart';
import 'package:dodohan/app/data/model/user.dart';
import 'package:dodohan/app/data/service/match_service/service.dart';
import 'package:dodohan/app/data/service/user_service/service.dart';
import 'package:dodohan/app/widgets/dialogs/action_dialog.dart';
import 'package:dodohan/app/widgets/dialogs/need_more_coin_dialog.dart';
import 'package:dodohan/app/widgets/dialogs/report_dialog.dart';
import 'package:dodohan/core/base_controller.dart';
import 'package:dodohan/core/services/auth_service.dart';
import 'package:dodohan/core/services/push_service.dart';
import 'package:dodohan/routes/app_routes.dart';
import 'package:get/get.dart';
import '../../../../../data/model/match.dart';
import '../../../../../data/service/me_info_service/service.dart';

class WeeklyMatchSucceedController extends BaseController {
  final UserService userService = UserService();
  final MatchService matchService = MatchService();
  final MeInfoService _meInfoService = MeInfoService();
  Rx<MeInfo> oppositeInfo = MeInfo().obs;

  late Rx<Match> match = Match().obs;
  late final String phoneNum, profileImage;

  User get user => AuthService.to.user.value;

  @override
  Future<void> onInit() async {
    match.value = Get.arguments['match'] as Match;
    phoneNum = Get.arguments['phoneNum'];
    profileImage = Get.arguments['profileImage'];
    oppositeInfo.value = await _meInfoService.findOne(match.value.you);
    isLoading.value = false;
    super.onInit();
  }

  Future<void> confirm() async {
    final int costCoin = user.isMan! ? 6 : 3;
    if (user.coin < costCoin) {
      Get.dialog(const NeedMoreCoinDialog());
      return;
    }

    showLoading();
    match.value = (await matchService.findOne(user.id, user.isMan!))!;
    matchService.updateMatchStatus(match.value.id!, user.isMan!, MatchStatus.confirmed);
    match.update((val) {
      if(user.isMan!) {
        val!.manStatus = MatchStatus.confirmed;
      } else {
        val!.womanStatus = MatchStatus.confirmed;
      }
    });

    //3. 유저 하트 갯수 차감 (백, 프론트)
    await userService.increaseCoin(user.id, -costCoin, type: CoinReceiptType.weeklyMatch);
    AuthService.to.user.update((user) => user!.coin = user.coin - costCoin);

    //푸시 및 보상
    if (match.value.youStatus == MatchStatus.confirmed) {
      FcmService.to.sendFcmPush(match.value.you, FcmPushType.weeklyMatched);
      hideLoading();
    } else if (match.value.youStatus == MatchStatus.rejected) {
      const refundCoin = 1;
      await userService.increaseCoin(user.id, refundCoin, type: CoinReceiptType.dailyCardRefund);
      AuthService.to.user.update((user) => user!.coin = user.coin + refundCoin);
      hideLoading();
      Get.back();
      Get.snackbar('매칭 실패', '상대방은 거절을 선택했습니다. 하트 $refundCoin개를 돌려 받습니다');
      return;
    } else {
      FcmService.to.sendFcmPush(match.value.you, FcmPushType.weeklyChoiceMade);
      hideLoading();
      Get.snackbar('수락 완료', '상대방이 결정을 내리면 알림을 보내드려요');
    }

  }

  Future<void> reject() async {
    showLoading();
    match.value = (await matchService.findOne(user.id, user.isMan!))!;
    await matchService.updateMatchStatus(match.value.id!, user.isMan!, MatchStatus.rejected);
    //3. 유저 하트 갯수 증가 (백, 프론트)
    final int rewardCoin = user.isMan! ? 1 : 2;
    await userService.increaseCoin(user.id, rewardCoin, type: CoinReceiptType.weeklyReject);
    AuthService.to.user.update((user) => user!.coin = user.coin + rewardCoin);

    //푸시 및 보상
    if (match.value.youStatus == MatchStatus.confirmed) {
      const refundCoin = 1;
      await userService.increaseCoin(match.value.you, refundCoin, type: CoinReceiptType.weeklyRefund);
      FcmService.to.sendFcmPush(match.value.you, FcmPushType.weeklyMatchFailed);
    } else if (match.value.youStatus == MatchStatus.unChecked || match.value.youStatus == MatchStatus.checked) {
      FcmService.to.sendFcmPush(match.value.you, FcmPushType.weeklyChoiceMade);
    }
    hideLoading();
    Get.back();
    Get.snackbar('하트 지급', '참여 보상으로 하트가 $rewardCoin개 지급되었습니다');
  }

  Future<void> showReportDialog() async {
    Get.dialog(ReportDialog(
      reportCallback: () async {
        return;
      },
      blockCallback: () async {
        FcmService.to.sendFcmPush(match.value.you, FcmPushType.weeklyChoiceMade);
        await matchService.updateMatchStatus(match.value.id!, user.isMan!, MatchStatus.rejected);
        Get.back();
      },
    ))  ;
  }
}
