import 'package:get/get.dart';
import 'camera_controller.dart';
import 'camera_repository.dart';

class CameraBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CameraPageController());
  }
}