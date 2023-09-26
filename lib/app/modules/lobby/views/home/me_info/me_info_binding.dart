import 'package:get/get.dart';
import 'me_info_controller.dart';

class MeInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MeInfoController());
  }
}