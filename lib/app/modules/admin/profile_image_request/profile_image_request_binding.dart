import 'package:get/get.dart';
import 'profile_image_request_controller.dart';

class ProfileImageRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileImageRequestController());
  }
}