import 'package:dodohan/app/modules/lobby/views/self_introduction/self_introduction_item/preview_my_profile/preview_my_profile_controller.dart';
import 'package:get/get.dart';

class PreviewMyProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PreviewMyProfileController());
  }
}