import 'dart:developer';

import 'package:dodohan/app/data/model/self_application.dart';
import 'package:get/get.dart';
import '../../../../../../core/base_controller.dart';
import '../../../../../../core/services/auth_service.dart';
import '../../../../../../core/services/push_service.dart';
import '../../../../../../routes/app_routes.dart';
import '../../../../../data/enums.dart';
import '../../../../../data/model/me_info.dart';
import '../../../../../data/model/self_introduction.dart';
import '../../../../../data/model/user.dart';
import '../../../../../data/service/me_info_service/service.dart';
import '../../../../../data/service/self_application_service/service.dart';
import '../../../../../data/service/self_introduction_service/service.dart';
import '../../../../../data/service/user_service/service.dart';
import '../../../../../widgets/dialogs/action_dialog.dart';
import '../../../../../widgets/dialogs/error_dialog.dart';

class SelfIntroductionItemController extends BaseController {
  final SelfIntroductionService _selfIntroductionService = SelfIntroductionService();
  final MeInfoService _meInfoService = MeInfoService();
  final UserService _userService = UserService();
  User get user => AuthService.to.user.value;

  final Rx<SelfIntroduction> selfIntroduction = SelfIntroduction().obs;

  @override
  Future<void> onInit() async {
    selfIntroduction.value = Get.arguments['selfIntroduction'];
    super.onInit();
  }

  void applyForFree() async {
    showLoading();
    final MeInfo meInfo = await _meInfoService.findOne(user.id);
    if (!meInfo.isCompleted) {
      hideLoading();
      Get.back();
      Get.dialog(const ErrorDialog(text: "'나' 의 프로필 작성을 완료해주세요"));
      return;
    }
    final SelfApplication selfApplication = await _selfIntroductionService.applyForFree(user, meInfo, selfIntroduction.value.id);
    selfIntroduction.update((item) => item!.applications.add(selfApplication));

    hideLoading();
    FcmService.to.sendFcmPush(selfIntroduction.value.meInfo!.user!, FcmPushType.selfIntroductionApply);
    Get.back();
    Get.snackbar('신청 완료', '상대방의 선택을 기다려주세요');
  }

  void applyWithCharge() async {
    showLoading();
    final MeInfo meInfo = await _meInfoService.findOne(user.id);
    if (!meInfo.isCompleted) {
      hideLoading();
      Get.back();
      Get.dialog(const ErrorDialog(text: "'나' 의 프로필 작성을 완료해주세요"));
      return;
    }

    const int costCoin = 3;
    if (user.coin < costCoin) {
      hideLoading();
      Get.back();
      Get.dialog(ActionDialog(title: '하트 부족', text: '스토어로 이동하기', confirmCallback: () {
        Get.back();
        Get.toNamed(Routes.store);
      }));
      return;
    }

    final SelfApplication selfApplication = await _selfIntroductionService.applyWithCharge(user, meInfo, selfIntroduction.value.id);
    selfIntroduction.update((item) => item!.applications.add(selfApplication));
    await _userService.increaseCoin(user.id, -costCoin, type: CoinReceiptType.selfIntroApply);
    AuthService.to.user.update((user) => user!.coin = user.coin - costCoin);
    hideLoading();
    FcmService.to.sendFcmPush(selfIntroduction.value.meInfo!.user!, FcmPushType.selfIntroductionApply);
    Get.back();
    Get.snackbar('신청 완료', '상대방의 선택을 기다려주세요');
  }
}

