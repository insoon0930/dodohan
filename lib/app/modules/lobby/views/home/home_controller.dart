import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dodohan/app/data/model/image_update_request.dart';
import 'package:dodohan/app/modules/splash/splash_controller.dart';
import 'package:dodohan/app/widgets/dialogs/application_dialog.dart';
import 'package:dodohan/app/widgets/dialogs/match/final_decision_dialog.dart';
import 'package:dodohan/app/widgets/dialogs/match/match_success_dialog.dart';
import 'package:dodohan/core/utils/time_utility.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../core/services/auth_service.dart';
import '../../../../../core/services/push_service.dart';
import '../../../../../core/theme/fonts.dart';
import '../../../../../core/utils/utility.dart';
import '../../../../../routes/app_routes.dart';
import '../../../../data/enums.dart';
import '../../../../data/model/application.dart';
import '../../../../data/model/me_info.dart';
import '../../../../data/model/match.dart';
import '../../../../data/model/user.dart';
import '../../../../data/model/you_info.dart';
import '../../../../data/provider/storage_service.dart';
import '../../../../data/service/application_service/service.dart';
import '../../../../data/service/image_update_request_service/service.dart';
import '../../../../data/service/match_service/service.dart';
import '../../../../data/service/me_info_service/service.dart';
import '../../../../data/service/user_service/service.dart';
import '../../../../data/service/you_info_service/service.dart';
import '../../../../widgets/dialogs/action_dialog.dart';
import '../../../../widgets/dialogs/error_dialog.dart';
import '../../../../widgets/dialogs/match/decision_waiting_dialog.dart';
import '../../../../widgets/dialogs/select/select_dialog.dart';
import '../../../../widgets/dialogs/select/select_dialog_item.dart';
import '../../../../widgets/dialogs/store_routing_dialog.dart';

class HomeController extends GetxController {
  final StorageService storageService = Get.find();
  final ApplicationService _applicationService = ApplicationService();
  final MeInfoService _meInfoService = MeInfoService();
  final YouInfoService _youInfoService = YouInfoService();
  final MatchService _matchService = MatchService();
  final UserService _userService = UserService();
  final ImageUpdateRequestService _imageUpdateRequestService = ImageUpdateRequestService();

  RxString leftDay = '0일 0시 0분 0초'.obs;
  Timer? timer;

  final RxInt manNum = 0.obs;
  final RxInt womanNum = 0.obs;
  RxInt get userNum => (manNum.value + womanNum.value).obs;
  RxDouble get genderRatio => (manNum.value / (womanNum.value == 0 ? 1 : womanNum.value)).obs;
  //'${(manNum.value / womanNum.value).toStringAsFixed(2)} : 1'

  User get user => AuthService.to.user.value;

  @override
  Future<void> onInit() async {

    if (user.id == '') {
      Get.put(SplashController());
      await 1.delay();
    }
    //users
    final res = await _userService.findUserNumIncludeDeleted();
    manNum.value = res['manNum']!;
    womanNum.value = res['womanNum']!;

    //timer
    final DateTime todaySimple = TimeUtility.todaySimple();
    final DateTime dueDay = TimeUtility.next(todaySimple, DateTime.friday)
        .subtract(const Duration(minutes: 5));
    Duration leftDuration = dueDay.difference(DateTime.now());
    if (leftDuration.isNegative) {
      leftDay.value = '0일 0시 0분 0초';
      return;
    }

    leftDay.value = TimeUtility.formatDuration(leftDuration);
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      final minusOneSecond = leftDuration - const Duration(seconds: 1);
      // Check if leftDuration is negative or zero
      if (minusOneSecond.isNegative || minusOneSecond.inSeconds == 0) {
        timer.cancel();
        leftDay.value = '0일 0시 0분 0초';
      } else {
        leftDuration = minusOneSecond;
        leftDay.value = TimeUtility.formatDuration(minusOneSecond);
      }
    });
    super.onInit();
  }

  @override
  Future<void> onClose() async {
    timer?.cancel();
    super.onClose();
  }

  Future<void> getInfos() async {
    Get.dialog(const Center(child: CircularProgressIndicator()), barrierDismissible: false);
    //validation 1. 신청 가능 시간
    final int currentWeekday = DateTime.now().weekday;
    if(currentWeekday == 5) { //금요일
      Get.back();
      Get.dialog(const ErrorDialog(text: '금요일에는 신청이 불가능합니다'));
      return;
    }

    //validation 2. 신청서 작성 완료
    MeInfo meInfo = await _meInfoService.findOne(user.id);
    YouInfo youInfo = await _youInfoService.findOne(user.id);
    if (!meInfo.isCompleted || !youInfo.isCompleted) {
      Get.back();
      Get.dialog(const ErrorDialog(text: "'나' 와 '이상형' 작성을 완료해주세요"));
      return;
    }

    //validation 3. 이번주 신청한 기록 없는지 _applicationService
    Application? application = await _applicationService.findThisWeekOne(user.id);
    if (application != null) {
      Get.back();
      Get.dialog(const ErrorDialog(text: "신청된 상태입니다"));
      return;
    }
    Get.back();
    Get.dialog(ApplicationDialog(
        meInfo: meInfo,
        youInfo: youInfo,
        applyClicked: () => _apply(meInfo, youInfo)));
  }

  Future<void> _apply(MeInfo meInfo, YouInfo youInfo) async {
    Get.dialog(const Center(child: CircularProgressIndicator()), barrierDismissible: false);
    await _applicationService.create(meInfo, youInfo);
    Get.back();
    Get.back();
    Get.snackbar('신청 완료', '결과는 금요일에 공개됩니다!');
  }

  Future<void> getMatchResult() async {
    if (kIsWeb) {
      Get.dialog(const StoreRoutingDialog());
      return;
    }

    Get.dialog(const Center(child: CircularProgressIndicator()), barrierDismissible: false);
    // validation 1. 확인 가능 시간
    final int currentWeekday = DateTime.now().weekday;
    if(currentWeekday != 5) { //금요일
      Get.back();
      Get.dialog(const ErrorDialog(text: '금요일 외에는 확인이 불가능합니다'));
      return;
    }

    //man: 6BqgdRdFUoZOPclxIzbD
    //woman: WdIHlWaTUAitbexvmW5E
    Match? match = await _matchService.findOne(user.id, user.isMan!);
    if (match == null) {
      //여기서 분기. 어플리케이션 찾아봄(없음 - 이번 회차에 신청하지 않았습니다, 있음 - 분기.)
      Application? application = await _applicationService.findThisWeekOne(user.id);
      Get.back();
      if (application == null) {
        Get.dialog(const ErrorDialog(text: "이번 회차에\n신청하지 않은 계정입니다"));
        return;
      }
      if (application.isRewarded) {
        Get.dialog(const ErrorDialog(text: "매칭된 상대가 없습니다 🥲\n다음주를 기약해주세요!"));
      } else {
        const int rewardCoin = 2;
        await _userService.increaseCoin(user.id, rewardCoin, type: CoinReceiptType.consoleReward);
        await _applicationService.updateIsRewarded(application.id);
        AuthService.to.user.update((user) => user!.coin = user.coin + rewardCoin);
        Get.dialog(ActionDialog(title: '매칭 실패', text: '다음을 기약하며\n하트 $rewardCoin개를 지급해드렸어요', confirmCallback: () => Get.back()));
      }
      return;
    }
    String phoneNum;
    String profileImage;
    if(user.isMan!) {
      User? woman = await _userService.findOne(match.woman);
      phoneNum = woman!.phoneNum;
      profileImage = woman.profileImage;
    } else {
      User? man = await _userService.findOne(match.man);
      phoneNum = man!.phoneNum;
      profileImage = man.profileImage;
    }

    //아랫것들 다 겟터로 적어두면좋겠다
    //내 상태 보고(1) (2차 선택 안했으면 해당 다이얼로그로)
    //처음 보는거면 상태 업데이트 umChecked > checked
    if((user.isMan! && match.manStatus == MatchStatus.unChecked) || (!user.isMan! && match.womanStatus == MatchStatus.unChecked)) {
      await _matchService.updateMatchStatus(match.id!, user.isMan!, MatchStatus.checked);
    }

    //2차 선택 다이얼로그로
    if ((user.isMan! && match.manStatus == MatchStatus.unChecked) ||
        (user.isMan! && match.manStatus == MatchStatus.checked) ||
        (!user.isMan! && match.womanStatus == MatchStatus.unChecked) ||
        (!user.isMan! && match.womanStatus == MatchStatus.checked)) {
      Get.back();
      Get.dialog(FinalDecisionDialog(_matchService,
          match: match,
          profileImage: profileImage,
          phoneNum: phoneNum,
          function: () => getMatchResult()));
      return;
    }

    //내 상태 보고(2) (내가 2차 거절했으면 거절했습니다 다이얼로그)
    if((user.isMan! && match.manStatus == MatchStatus.rejected) || (!user.isMan! && match.womanStatus == MatchStatus.rejected)) {
      Get.back();
      Get.dialog(const ErrorDialog(text: '거절한 매칭입니다'));
      return;
    }

    //여기서부터는 상대 상태 기준
    //상대가 확인 안했음
    if((user.isMan! && match.womanStatus == MatchStatus.unChecked) || (!user.isMan! && match.manStatus == MatchStatus.unChecked)) {
      Get.back();
      Get.dialog(DecisionWaitingDialog(profileImage: profileImage, status: MatchStatus.unChecked));
      return;
    }

    //상대가 확인했는데 선택 안했음
    if((user.isMan! && match.womanStatus == MatchStatus.checked) || (!user.isMan! && match.manStatus == MatchStatus.checked)) {
      Get.back();
      Get.dialog(DecisionWaitingDialog(profileImage: profileImage, status: MatchStatus.checked));
      return;
    }

    //상대가 거절했음
    if((user.isMan! && match.womanStatus == MatchStatus.rejected) || (!user.isMan! && match.manStatus == MatchStatus.rejected)) {
      Get.back();
      Get.dialog(ActionDialog(title: '최종 매칭 실패', text: '상대방이 거절한 매치입니다', confirmCallback: () => Get.back()));
      return;
    }

    //최종 매칭
    Get.back();
    Get.dialog(MatchSuccessDialog(match: match, phoneNum: phoneNum, profileImage: profileImage));
  }

  Stream<int> getApplicantsNumStream() {
    return _applicationService.getApplicantsNumStream();
  }

  Future<void> tapProfileImage() async {
    Get.dialog(SelectDialog(itemHeight: 60, items: [
      SelectDialogItem(
          text: '사진 변경',
          onTap: () {
            Get.back();
            _updateProfileImage();
          },
          first: true,
          style: ThemeFonts.semiBold.getTextStyle(size: 15)),
      SelectDialogItem(
          text: '사진 보기',
          onTap: () => Get.dialog(Dialog(child: CachedNetworkImage(imageUrl: user.profileImage))),
          last: true,
          style: ThemeFonts.semiBold.getTextStyle(size: 15)),
    ]));
    return ;
  }

  Future<void> _updateProfileImage() async {
    //신청중인 상태인지 확인
    Get.dialog(const Center(child: CircularProgressIndicator()), barrierDismissible: false);
    ImageUpdateRequest? waitingRequest = await _imageUpdateRequestService.findOneWaiting(user.id);
    Get.back();
    if (waitingRequest != null) {
      return Get.dialog(const ErrorDialog(text: '심사중인 프로필이 있습니다'));
    }

    Get.dialog(ActionDialog(
      title: '프로필 변경 신청',
      text: '본인 확인이 어려운 사진은 반려될 수 있습니다 (마스크, 모자, 옆모습, 어두운, 많이 가려진, 여러명의 얼굴이 나온, ai 프로필 등...) \n\n * 하트 1개가 소모됩니다',
      confirmCallback: () {
        Get.back();
        if (user.coin < 1) {
          Get.dialog(ActionDialog(title: '하트 부족', text: '스토어로 이동하기', confirmCallback: () {
            Get.back();
            Get.toNamed(Routes.store);
          }));
          return;
        }
        Get.dialog(SelectDialog(itemHeight: 60, items: [
          SelectDialogItem(
              text: '카메라',
              onTap: () => _createRequest(ImageSource.camera),
              first: true,
              style: ThemeFonts.semiBold.getTextStyle(size: 15)),
          SelectDialogItem(
              text: '사진',
              onTap: () => _createRequest(ImageSource.gallery),
              last: true,
              style: ThemeFonts.semiBold.getTextStyle(size: 15)),
        ]));
      },
    ));
    return ;
  }

  Future<void> _createRequest(ImageSource imageSource) async {
    Get.back();
    XFile? result = await Utility.getImage(source: imageSource, onlySquare: true);
    if (result != null) {
      Get.dialog(const Center(child: CircularProgressIndicator()), barrierDismissible: false);
      String profileUrl = await storageService.uploadFile(
          file: result,
          bucket: StorageBucket.profile,
          userId: user.id);
      await _imageUpdateRequestService.create(ImageUpdateRequest(
          user: user.id,
          newProfileImage: profileUrl,
          preProfileImage: user.profileImage,
          coinUsed: true));

      //코인 차감
      await _userService.increaseCoin(user.id, -1, type: CoinReceiptType.imageUpdateRequest);
      AuthService.to.user.update((user) => user!.coin = user.coin -1);

      // //fcm push //todo 나중에 .env 도입해주던가 //중단
      // FcmService.to.sendFcmPush('6BqgdRdFUoZOPclxIzbD', FcmPushType.imageUpdateRequest);

      Get.back();
      Get.snackbar('신청 완료', '심사 통과시 반영됩니다');
    }
  }
}

