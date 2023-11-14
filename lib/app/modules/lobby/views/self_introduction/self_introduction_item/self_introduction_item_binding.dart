import 'package:dodohan/app/modules/lobby/views/self_introduction/self_introduction_item/self_introduction_item_controller.dart';
import 'package:get/get.dart';

class SelfIntroductionItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SelfIntroductionItemController());
  }
}