import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/services/auth_service.dart';
import '../../data/dummy.dart';
import '../../data/enums.dart';
import '../../data/model/identity.dart';
import '../../data/model/me_info.dart';
import '../../data/model/user.dart';
import '../../data/model/you_info.dart';
import '../../data/service/application_service/service.dart';
import '../../data/service/identity_service/service.dart';
import '../../data/service/user_service/service.dart';

class AdminController extends GetxController {
  final IdentityService identityService = IdentityService();
  final UserService userService = UserService();
  final ApplicationService applicationService = ApplicationService();

  final RxList<Identity> waitingIds = <Identity>[].obs;
  User get user => AuthService.to.user.value;


  @override
  Future<void> onInit() async {
    waitingIds.value = await identityService.findWaiting();
    super.onInit();
  }

  Future<void> confirm(Identity identity) async {
    Get.dialog(const Center(child: CircularProgressIndicator()), barrierDismissible: false);
    await identityService.confirmed(identity);
    waitingIds.removeWhere((item) => item.id == identity.id);
    Get.back();
  }

  Future<void> reject(Identity identity) async {
    Get.dialog(const Center(child: CircularProgressIndicator()), barrierDismissible: false);
    await identityService.rejected(identity);
    waitingIds.removeWhere((item) => item.id == identity.id);
    Get.back();
  }

  Future<void> createManApplicationDummy() async {
    MeInfo meInfo = Dummy.manMeInfo;
    YouInfo youInfo = Dummy.manYouInfo;
    await applicationService.create(meInfo, youInfo);
    Get.snackbar('남자 신청', '추가 완료');
  }

  Future<void> createWomanApplicationDummy() async {
    MeInfo meInfo = Dummy.womanMeInfo;
    YouInfo youInfo = Dummy.womanYouInfo;
    await applicationService.create(meInfo, youInfo);
    Get.snackbar('남자 신청', '추가 완료');
  }
  ////@Post
//   Future<void> createManApplicationDummy() async {
//     await _identityRepository.updateStatus(identity.id, IdStatus.rejected);
//     await _userRepository.rejected(identity);
//     return;
//   }

}

