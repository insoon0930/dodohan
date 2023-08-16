import 'package:get/get.dart';
import 'match_controller.dart';

class MatchBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MatchController());
  }
}