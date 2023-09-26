import 'package:get/get.dart';
import 'daily_card_controller.dart';

class DailyCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DailyCardController());
  }
}