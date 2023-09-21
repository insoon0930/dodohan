import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/services/auth_service.dart';
import '../../../../../routes/app_routes.dart';
import '../../../../data/service/user_service/service.dart';

class StoreFailController extends GetxController {
  final UserService _userService = UserService();

  @override
  Future<void> onInit() async {
    print('StoreFailController onInit');
    final prefs = await SharedPreferences.getInstance();
    String uid = prefs.getString('uid')!;
    AuthService.to.user.value = (await _userService.findOneByUid(uid))!;
    super.onInit();
  }

  Future<void> confirm() async {
    Get.offAllNamed(Routes.lobby);
    Get.snackbar('결제 실패', '결제 승인에 실패했습니다.');
  }

}

