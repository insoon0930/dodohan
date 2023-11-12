import 'package:cached_network_image/cached_network_image.dart';
import 'package:dodohan/app/widgets/dialogs/action_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/services/auth_service.dart';
import '../../../core/services/push_service.dart';
import '../../../routes/app_routes.dart';
import '../../data/dummy.dart';
import '../../data/enums.dart';
import '../../data/model/identity.dart';
import '../../data/model/me_info.dart';
import '../../data/model/user.dart';
import '../../data/model/you_info.dart';
import '../../data/service/application_service/service.dart';
import '../../data/service/identity_service/service.dart';
import '../../data/service/you_info_service/service.dart';
import '../../widgets/image/image_view_box.dart';

class AdminController extends GetxController {
  final IdentityService identityService = IdentityService();
  final ApplicationService applicationService = ApplicationService();
  final YouInfoService youInfoService = YouInfoService();

  final RxList<Identity> waitingIds = <Identity>[].obs;
  User get user => AuthService.to.user.value;


  @override
  Future<void> onInit() async {
    if(user.phoneNum != '+821066192550') {
      Get.offAllNamed(Routes.loginBy);
      return;
    }
    waitingIds.value = await identityService.findWaiting();
    super.onInit();
  }

  Future<void> confirm(Identity identity) async {
    Get.dialog(const Center(child: CircularProgressIndicator()), barrierDismissible: false);
    await identityService.confirmed(identity);
    waitingIds.removeWhere((item) => item.id == identity.id);
    FcmService.to.sendFcmPush(identity.user, FcmPushType.identityConfirm);
    Get.back();
  }

  Future<void> reject(Identity identity) async {
    Get.dialog(const Center(child: CircularProgressIndicator()), barrierDismissible: false);
    await identityService.rejected(identity);
    waitingIds.removeWhere((item) => item.id == identity.id);
    FcmService.to.sendFcmPush(identity.user, FcmPushType.identityReject);
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

  Future<void> updateYouInfoBodyShapeType() async {
    await youInfoService.updateBodyShapeType();
    Get.snackbar('필드 업데이트', '완료');
  }

  Future<void> updateApplicationBodyShapeType() async {
    await applicationService.updateBodyShapeType();
    Get.snackbar('필드 업데이트', '완료');
  }

  //todo 404 해결 아마 공개 권한? 문제일듯
  void openFullImage(String url) {
    Get.dialog(Dialog(child: CachedNetworkImage(imageUrl: url)));
  }


  ////@Post
//   Future<void> createManApplicationDummy() async {
//     await _identityRepository.updateStatus(identity.id, IdStatus.rejected);
//     await _userRepository.rejected(identity);
//     return;
//   }

}

