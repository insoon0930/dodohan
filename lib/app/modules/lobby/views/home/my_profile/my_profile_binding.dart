import 'package:dodohan/app/modules/lobby/views/home/my_profile/my_profile_controller.dart';
import 'package:get/get.dart';

class MyProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MyProfileController());
  }
}