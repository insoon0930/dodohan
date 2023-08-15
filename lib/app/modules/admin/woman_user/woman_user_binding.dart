import 'package:get/get.dart';
import 'woman_user_controller.dart';

class WomanUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(WomanUserController());
  }
}