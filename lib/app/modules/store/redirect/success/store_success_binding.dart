import 'package:get/get.dart';
import 'store_success_controller.dart';

class StoreSuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(StoreSuccessController());
  }
}