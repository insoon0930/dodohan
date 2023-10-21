import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dodohan/core/services/auth_service.dart';

import '../../../../core/base_controller.dart';
import '../../../../routes/app_routes.dart';
import '../../../data/enums.dart';
import '../../../data/model/user.dart';
import '../../../data/service/user_service/service.dart';
import '../../splash/splash_controller.dart';

class WaitingController extends BaseController {
  final UserService _userService = UserService();

  @override
  Future<void> onInit() async {
    print('RegisterController onInit');
    if (AuthService.to.user.value.id == '') {
      Get.put(SplashController());
      await 1.delay();
    }
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
