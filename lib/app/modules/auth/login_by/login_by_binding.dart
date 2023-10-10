import 'package:get/get.dart';
import 'package:dodohan/app/data/service/identity_service/service.dart';
import 'login_by_controller.dart';

class LoginByBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(LoginByController());
  }
}