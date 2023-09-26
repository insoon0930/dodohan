import 'package:get/get.dart';
import 'you_info_controller.dart';

class YouInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(YouInfoController());
  }
}