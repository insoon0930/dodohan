import 'package:dodohan/app/modules/lobby/views/home/me_info/me_info_controller.dart';
import 'package:dodohan/core/base_controller.dart';
import 'package:get/get.dart';

class MyProfileController extends BaseController {
  final MeInfoController meInfoController = Get.find();

  RxBool isBlurred = true.obs;
}
