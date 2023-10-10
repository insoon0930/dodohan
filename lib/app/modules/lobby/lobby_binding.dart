import 'package:get/get.dart';
import 'package:dodohan/app/modules/lobby/views/home/home_controller.dart';
import 'lobby_controller.dart';

class LobbyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LobbyController());
    Get.put(HomeController());
  }
}