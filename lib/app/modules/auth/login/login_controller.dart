import 'package:get/get.dart';
import 'login_repository.dart';

class LoginController extends GetxController {
  final RxBool isManStage = true.obs;
  final LoginRepository repo;
  LoginController({required this.repo});

  @override
  Future<void> onInit() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   String? uid = prefs.getString('uid');
  //   User initUser = User();
  //
  //   if (uid == null) {
  //     uid = Utility.randomString(8);
  //     prefs.setString('uid', uid);
  //     initUser.uid = uid;
  //     repo.createUser(initUser);
  //   }
  //
  //   var user = await repo.findOneByUid(uid);
  //   if (user == null) {
  //     initUser.uid = uid;
  //     user = await repo.createUser(initUser);
  //   }
  //
  //   AuthController.to.updateUser(user);
  //
  //   _duration.delay(() => Get.offAllNamed(Routes.navigation));
    super.onInit();
  }
}
