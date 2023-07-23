import 'package:get/get.dart';
import 'register_controller.dart';
import 'register_repository.dart';

class RegisterBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(RegisterController(repo: RegisterRepository()));
  }
}