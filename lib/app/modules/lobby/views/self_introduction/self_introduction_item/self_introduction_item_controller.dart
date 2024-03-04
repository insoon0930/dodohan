
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
  final SelfApplicationService _selfApplicationService = SelfApplicationService();
  final MeInfoService _meInfoService = MeInfoService();
  final UserService _userService = UserService();

  final Rx<SelfIntroduction> selfIntroduction = SelfIntroduction().obs;
  late Rxn<SelfApplication> selfApplication = Rxn<SelfApplication>();
  final RxList<SelfApplication> applications = <SelfApplication>[].obs;

  User get user => AuthService.to.user.value;

  @override
  Future<void> onInit() async {
    selfIntroduction.value = Get.arguments['selfIntroduction'];
    selfApplication.value = await _selfApplicationService.findOne(selfIntroduction.value.id, user.id);
    isLoading.value = false;

    if (selfIntroduction.value.isMine) {
      applications.value = await _selfApplicationService.findMany(selfIntroduction.value.id);
    }
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
    final SelfApplication updatedSelfApplication = await _selfIntroductionService.applyForFree(user, meInfo, selfIntroduction.value.id);
    selfApplication.value =  updatedSelfApplication;
    selfIntroduction.update((item) => item!.applicants.add(user.id));
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

    final SelfApplication updatedSelfApplication = await _selfIntroductionService.applyWithCharge(user, meInfo, selfIntroduction.value.id);
    selfApplication.value = updatedSelfApplication;
    selfIntroduction.update((item) => item!.applicants.add(user.id));
    await _userService.increaseCoin(user.id, -costCoin, type: CoinReceiptType.selfIntroApply);
    AuthService.to.user.update((user) => user!.coin = user.coin - costCoin);
    hideLoading();
    FcmService.to.sendFcmPush(selfIntroduction.value.meInfo!.user!, FcmPushType.selfIntroductionApply);
    Get.back();
    Get.snackbar('신청 완료', '상대방의 선택을 기다려주세요');
  }

  Future<void> confirm2nd() async {
    Get.back();
    const int costCoin = 3;
    if (user.coin < costCoin) {
      Get.dialog(ActionDialog(title: '하트 부족', text: '스토어로 이동하기', confirmCallback: () {
        Get.back();
        Get.toNamed(Routes.store);
      }));
      return;
    }
    showLoading();
    _selfApplicationService.updateStatus(selfApplication.value!.id, SelfApplicationStatus.confirmed2nd);
    selfApplication.update((val) => val!.status = SelfApplicationStatus.confirmed2nd);
    FcmService.to.sendFcmPush(selfIntroduction.value.meInfo!.user!, FcmPushType.selfIntroductionConfirmed2nd);

    //코인 차감
    await _userService.increaseCoin(user.id, -costCoin, type: CoinReceiptType.selfIntroConfirm2nd);
    AuthService.to.user.update((user) => user!.coin = user.coin - costCoin);
    hideLoading();
    Get.snackbar('매칭 성공', '상대방의 전화번호를 확인하세요!');
  }

  Future<void> confirm1stForFree() async {
    Get.back();
    showLoading();
    _selfApplicationService.updateStatus(selfApplication.value!.id, SelfApplicationStatus.confirmed1st);
    selfApplication.update((val) => val!.status = SelfApplicationStatus.confirmed1st);
    FcmService.to.sendFcmPush(selfApplication.value!.meInfo.user!, FcmPushType.selfIntroductionConfirmed1st);
    hideLoading();
    Get.snackbar('수락 완료', '상대방의 선택을 기다려주세요');
  }

  Future<void> confirm1stWithCharge() async {
    Get.back();
    const int costCoin = 3;
    if (user.coin < costCoin) {
      Get.dialog(ActionDialog(title: '하트 부족', text: '스토어로 이동하기', confirmCallback: () {
        Get.back();
        Get.toNamed(Routes.store);
      }));
      return;
    }

    showLoading();
    _selfApplicationService.updateStatus(selfApplication.value!.id, SelfApplicationStatus.confirmed1st);
    selfApplication.update((val) => val!.status = SelfApplicationStatus.confirmed1st);
    FcmService.to.sendFcmPush(selfApplication.value!.meInfo.user!, FcmPushType.selfIntroductionConfirmed1st);

    //코인 차감
    await _userService.increaseCoin(user.id, -costCoin, type: CoinReceiptType.selfIntroConfirm1st);
    AuthService.to.user.update((user) => user!.coin = user.coin - costCoin);
    hideLoading();
    Get.snackbar('수락 완료', '상대방의 선택을 기다려주세요');
  }

  Future<void> openClosedCard(int index, SelfApplication application) async {
    const int costCoin = 1;
    Get.back();
    if (user.coin < costCoin) {
      Get.dialog(ActionDialog(title: '하트 부족', text: '스토어로 이동하기', confirmCallback: () {
        Get.back();
        Get.toNamed(Routes.store);
      }));
      return;
    }
    showLoading();
    _selfApplicationService.updateStatus(application.id, SelfApplicationStatus.openedByOwner);
    applications[index].status = SelfApplicationStatus.openedByOwner;
    applications.refresh();
    //코인 차감
    await _userService.increaseCoin(user.id, -costCoin, type: CoinReceiptType.selfIntroOpenApplicantCard);
    AuthService.to.user.update((user) => user!.coin = user.coin - costCoin);
    hideLoading();
  }

  void goToCheckOppositeProfile(SelfApplication targetApplication) {
    selfApplication.value = targetApplication;
    Get.toNamed(Routes.checkOppositeProfile);
  }

  Future<void> delete(selfIntroductionId) async {
    showLoading();
    await _selfIntroductionService.delete(selfIntroductionId);
    hideLoading();
    Get.back();
    Get.back();
    Get.snackbar('삭제 완료', '나의 셀프 소개가 삭제 완료되었습니다');
  }
}

