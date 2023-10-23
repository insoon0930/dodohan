import 'package:get/get.dart';
import 'current_card_item_controller.dart';

class CurrentCardItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CurrentCardItemController());
  }
}