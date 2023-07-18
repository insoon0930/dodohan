import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stamp_now/core/utils/utility.dart';
import '../../data/model/user.dart';
import '../../../routes/app_routes.dart';
import '../../../core/controllers/auth_controller.dart';
import 'splash_repository.dart';

class SplashController extends GetxController {
  final SplashRepository repo;
  SplashController({required this.repo});

  final _duration = 1.seconds;

  @override
  Future<void> onInit() async {
    final prefs = await SharedPreferences.getInstance();
    String? uid = prefs.getString('uid');
    User initUser = User();

    if (uid == null) {
      uid = Utility.randomString(8);
      prefs.setString('uid', uid);
      initUser.uid = uid;
      repo.createUser(initUser);
    }

    var user = await repo.findOneByUid(uid);
    if (user == null) {
      initUser.uid = uid;
      user = await repo.createUser(initUser);
    }

    AuthController.to.updateUser(user);

    _duration.delay(() => Get.offAllNamed(Routes.navigation));
    super.onInit();
  }
}
