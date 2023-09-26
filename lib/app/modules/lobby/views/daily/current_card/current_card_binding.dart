import 'package:get/get.dart';
import 'current_card_controller.dart';

class CurrentCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CurrentCardController());
  }
}