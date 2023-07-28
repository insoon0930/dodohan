import 'package:get/get.dart';
import 'package:stamp_now/app/data/service/identity_service/service.dart';
import 'register_controller.dart';

class RegisterBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(RegisterController());
  }
}