import 'package:get/get.dart';

import 'application_controller.dart';

class ApplicationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ApplicationController());
  }
}