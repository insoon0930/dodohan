import 'package:dodohan/app/modules/lobby/views/home/weekly_match_succeed/weekly_match_succeed_controller.dart';
import 'package:get/get.dart';

class WeeklyMatchSucceedBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(WeeklyMatchSucceedController());
  }
}