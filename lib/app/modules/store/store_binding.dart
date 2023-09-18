import 'package:get/get.dart';
import 'store_controller.dart';

class StoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(StoreController());
  }
}