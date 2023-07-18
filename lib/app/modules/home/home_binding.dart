import 'package:get/get.dart';
import '../../../core/controllers/auth_controller.dart';
import 'home_controller.dart';
import 'home_repository.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(repo: HomeRepository()));
  }
}