import 'package:get/get.dart';
import 'login_controller.dart';
import 'login_repository.dart';

class LoginBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(LoginController(repo: LoginRepository()));
  }
}