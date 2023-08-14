import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stamp_now/app/data/model/image_update_request.dart';
import 'package:stamp_now/app/modules/splash/splash_controller.dart';
import 'package:stamp_now/app/widgets/dialogs/application_dialog.dart';
import 'package:stamp_now/app/widgets/dialogs/match_success_dialog.dart';
import 'package:stamp_now/core/utils/time_utility.dart';
import '../../../core/services/auth_service.dart';
import '../../../core/theme/fonts.dart';
import '../../../core/utils/utility.dart';
import '../../data/enums.dart';
import '../../data/model/me_info.dart';
import '../../data/model/match.dart';
import '../../data/model/user.dart';
import '../../data/model/you_info.dart';
import '../../data/provider/storage_service.dart';
import '../../data/service/application_service/service.dart';
import '../../data/service/image_update_request_service/service.dart';
import '../../data/service/match_service/service.dart';
import '../../data/service/me_info_service/service.dart';
import '../../data/service/user_service/service.dart';
import '../../data/service/you_info_service/service.dart';
import '../../widgets/dialogs/action_dialog.dart';
import '../../widgets/dialogs/error_dialog.dart';
import '../../widgets/dialogs/select/select_dialog.dart';
import '../../widgets/dialogs/select/select_dialog_item.dart';

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

  User get user => AuthService.to.user.value;

  @override
  Future<void> onInit() async {
    if (user.id == '') {
      Get.put(SplashController());
      await 1.delay();
    }

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
    if (meInfo.toJson().containsValue(null) ||
        youInfo.toJson().containsValue(null)) {
      Get.back();
      Get.dialog(const ErrorDialog(text: "'나' 와 '이상형' 작성을 완료해주세요"));
      return;
    }

    //validation 3. 이번주 신청한 기록 없는지 _applicationService
    if (await _applicationService.isAlreadyApplied(user.id)) {
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
    //validation 1. 확인 가능 시간
    final int currentWeekday = DateTime.now().weekday;
    if(currentWeekday != 5) { //금요일
      Get.dialog(const ErrorDialog(text: '금요일 외에는 확인이 불가능합니다'));
      return;
    }

    Match? match = await _matchService.findOne(user.id, user.isMan!);
    if (match == null) {
      Get.dialog(const ErrorDialog(text: "매칭된 상대가 없습니다 🥲\n다음주를 기약해주세요!"));
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

    Get.dialog(MatchSuccessDialog(phoneNum: phoneNum, profileImage: profileImage));
  }

  Stream<int> getApplicantsNumStream() {
    return _applicationService.getApplicantsNumStream();
  }

  Future<void> updateProfileImage() async {
    //신청중인 상태인지 확인
    Get.dialog(const Center(child: CircularProgressIndicator()), barrierDismissible: false);
    ImageUpdateRequest? waitingRequest = await _imageUpdateRequestService.findOneWaiting(user.id);
    Get.back();
    if (waitingRequest != null) {
      return Get.dialog(const ErrorDialog(text: '심사중인 프로필이 있습니다'));
    }

    Get.dialog(ActionDialog(
      title: '프로필 변경 신청',
      text: '본인 확인이 어려운 사진은 반려될 수 있습니다 (마스크, 모자, 옆모습, 어두운, 많이 가려진, 여러명의 얼굴이 나온, ai 프로필 등...)',
      confirmCallback: () {
        Get.back();
        return Get.dialog(SelectDialog(itemHeight: 60, items: [
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
    XFile? result = await Utility.getImage(source: ImageSource.camera);
    if (result != null) {
      Get.dialog(const Center(child: CircularProgressIndicator()), barrierDismissible: false);
      String profileUrl = await storageService.uploadFile(
          file: result,
          bucket: StorageBucket.profile,
          userId: user.id);
      await _imageUpdateRequestService.create(ImageUpdateRequest(
          user: user.id,
          newProfileImage: profileUrl,
          preProfileImage: user.profileImage));
      Get.back();
      Get.snackbar('신청 완료', '심사 통과시 반영됩니다');
    }
  }
}

