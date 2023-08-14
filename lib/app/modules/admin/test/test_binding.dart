import 'package:get/get.dart';
import 'test_controller.dart';

class TestBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TestController());
  }
}