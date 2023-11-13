import 'package:get/get.dart';
import 'create_self_introduction_controller.dart';

class CreateSelfIntroductionPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CreateSelfIntroductionPageController());
  }
}