import 'package:get/get.dart';
import 'store_fail_controller.dart';

class StoreFailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(StoreFailController());
  }
}