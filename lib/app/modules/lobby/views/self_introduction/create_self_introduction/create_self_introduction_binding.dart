import 'package:get/get.dart';
import 'create_self_introduction_controller.dart';

class CreateSelfIntroductionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CreateSelfIntroductionController());
  }
}