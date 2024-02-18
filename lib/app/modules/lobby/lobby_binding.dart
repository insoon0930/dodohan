import 'package:dodohan/app/modules/lobby/views/home/me_info/me_info_controller.dart';
import 'package:dodohan/app/modules/lobby/views/home/you_info/you_info_controller.dart';
import 'package:get/get.dart';
import 'package:dodohan/app/modules/lobby/views/home/home_controller.dart';
import 'lobby_controller.dart';

class LobbyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LobbyController());
    Get.put(HomeController());
    Get.put(MeInfoController());
    Get.put(YouInfoController());
  }
}