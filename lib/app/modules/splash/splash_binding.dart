import 'package:get/get.dart';
import 'package:stamp_now/app/modules/splash/splash_controller.dart';
import 'splash_repository.dart';

class SplashBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(SplashController(repo: SplashRepository()));
  }
}