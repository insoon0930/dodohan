import 'package:get/get.dart';

import '../../app/data/model/user.dart';

enum CameraSetting { saveOriginal, saveImmediately, cameraImmediately }
enum StampSetting { color, stamp, time, format }

class AuthController extends GetxController {
  static AuthController get to => Get.find<AuthController>();

  Rx<User> user = User().obs;

  updateUser(User newUser) {
    user.value = newUser;
  }

  updateCameraSetting(CameraSetting setting, bool value) {
    user.update((user) {
      user!.cameraSetting[setting.name] = value;
    });
  }

  updateDarkMode(bool value) {
    user.update((user) {
      user!.darkMode = value;
    });
  }
}