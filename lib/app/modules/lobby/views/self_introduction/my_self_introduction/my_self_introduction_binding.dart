import 'package:get/get.dart';

import 'my_self_introduction_controller.dart';

class MySelfIntroductionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MySelfIntroductionController());
  }
}