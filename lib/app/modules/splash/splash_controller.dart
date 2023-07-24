import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/services/auth_service.dart';
import '../../../routes/app_routes.dart';

class SplashController extends GetxController {
  // final _duration = 1.seconds;

  @override
  Future<void> onInit() async {
    final prefs = await SharedPreferences.getInstance();
    String? uid = prefs.getString('uid');

    if (uid != null) {
      await AuthService.to.loginByUid(uid);
    } else {
      Get.offAllNamed(Routes.login);
    }

    // if (uid == null) {
    //   uid = Utility.randomString(8);
    //   prefs.setString('uid', uid);
    //   initUser.uid = uid;
    //   repo.createUser(initUser);
    // }

    // var user = await repo.findOneByUid(uid);
    // if (user == null) {
    //   initUser.uid = uid;
    //   user = await repo.createUser(initUser);
    // }

    // AuthController.to.updateUser(user);

    // _duration.delay(() => Get.offAllNamed(Routes.navigation));
    super.onInit();
  }
}
