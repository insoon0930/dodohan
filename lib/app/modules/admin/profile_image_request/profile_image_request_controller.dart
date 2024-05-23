import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dodohan/app/data/model/image_update_request.dart';

import '../../../../core/services/auth_service.dart';
import '../../../../core/services/push_service.dart';
import '../../../../routes/app_routes.dart';
import '../../../data/enums.dart';
import '../../../data/model/user.dart';
import '../../../data/service/image_update_request_service/service.dart';
import '../../../data/service/user_service/service.dart';

class ProfileImageRequestController extends GetxController {
  final ImageUpdateRequestService imageUpdateRequestService = ImageUpdateRequestService();
  final UserService userService = UserService();

  final RxList<ImageUpdateRequest> waitingRequests = <ImageUpdateRequest>[].obs;
  User get user => AuthService.to.user.value;


  @override
  Future<void> onInit() async {
    if(!AuthService.to.isAdmin) {
      Get.offAllNamed(Routes.loginBy);
      return;
    }

    waitingRequests.value = await imageUpdateRequestService.findWaiting();
    super.onInit();
  }

  Future<void> confirm(ImageUpdateRequest item) async {
    Get.dialog(const Center(child: CircularProgressIndicator()), barrierDismissible: false);
    await imageUpdateRequestService.confirmed(item);
    waitingRequests.removeWhere((e) => e.id == item.id);
    FcmService.to.sendFcmPush(item.user, FcmPushType.imageUpdateConfirm);
    Get.back();
  }

  Future<void> reject(ImageUpdateRequest item) async {
    Get.dialog(const Center(child: CircularProgressIndicator()), barrierDismissible: false);
    await imageUpdateRequestService.rejected(item);
    if (item.coinUsed) {
      await userService.increaseCoin(item.user, 2, type: CoinReceiptType.imageUpdateReject);
    }
    waitingRequests.removeWhere((e) => e.id == item.id);
    FcmService.to.sendFcmPush(item.user, FcmPushType.imageUpdateReject);
    Get.back();
  }
}
