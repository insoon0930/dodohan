import 'package:get/get.dart';
import 'package:dodohan/app/data/service/identity_service/service.dart';
import 'waiting_controller.dart';

class WaitingBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(WaitingController(), permanent: true);
  }
}