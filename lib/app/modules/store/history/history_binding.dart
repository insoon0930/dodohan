import 'package:get/get.dart';
import 'history_controller.dart';

class StoreHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(StoreHistoryController());
  }
}