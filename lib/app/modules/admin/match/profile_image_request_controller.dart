import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stamp_now/app/data/model/image_update_request.dart';

import '../../../../core/services/auth_service.dart';
import '../../../../routes/app_routes.dart';
import '../../../data/model/identity.dart';
import '../../../data/model/user.dart';
import '../../../data/service/image_update_request_service/service.dart';

class MatchController extends GetxController {
  final ImageUpdateRequestService imageUpdateRequestService = ImageUpdateRequestService();

  final RxList<ImageUpdateRequest> waitingRequests = <ImageUpdateRequest>[].obs;
  User get user => AuthService.to.user.value;


  @override
  Future<void> onInit() async {
    if(user.phoneNum != '+821066192550') {
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
    Get.back();
  }

  Future<void> reject(ImageUpdateRequest item) async {
    Get.dialog(const Center(child: CircularProgressIndicator()), barrierDismissible: false);
    await imageUpdateRequestService.rejected(item);
    waitingRequests.removeWhere((e) => e.id == item.id);
    Get.back();
  }
}
