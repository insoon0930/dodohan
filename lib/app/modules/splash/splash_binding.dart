import 'package:get/get.dart';
import 'package:stamp_now/app/modules/splash/splash_controller.dart';

class SplashBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(SplashController());
  }
}