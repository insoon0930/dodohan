import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stamp_now/app/data/model/identity.dart';
import 'package:stamp_now/core/services/auth_service.dart';

import '../../../../core/base_controller.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/fonts.dart';
import '../../../../routes/app_routes.dart';
import '../../../data/enums.dart';
import '../../../data/info_data.dart';
import '../../../data/model/user.dart';
import '../../../data/provider/storage_service.dart';
import '../../../data/service/identity_service/service.dart';
import '../../../data/service/user_service/service.dart';
import '../../../widgets/dialogs/error_dialog.dart';
import '../../splash/splash_controller.dart';

class WaitingController extends BaseController {
  final UserService _userService = UserService();

  @override
  Future<void> onInit() async {
    print('RegisterController onInit');
    Get.put(SplashController());
    super.onInit();
  }

  Future<void> refreshPage() async {
    final prefs = await SharedPreferences.getInstance();
    String? uid = prefs.getString('uid');
    User? user = await _userService.findOneByUid(uid!);

    if(user == null) {
      Get.offAllNamed(Routes.register);
    }

    if (user!.idStatus == null ||
        user.idStatus == IdStatus.rejected) {
      AuthService.to.user.value = user;
      Get.offAllNamed(Routes.register);
      return;
    } else if (user.idStatus == IdStatus.waiting) {
      Get.snackbar('인증 심사중', '심사가 완료되지 않았습니다');
      return;
    } else if (user.idStatus == IdStatus.confirmed) {
      AuthService.to.user.value = user;
      Get.offAllNamed(Routes.lobby);
      return;
    }
  }
}
