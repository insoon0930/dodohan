import 'dart:developer';

import 'package:get/get.dart';
import '../../../../../../core/base_controller.dart';
import '../../../../../data/model/self_introduction.dart';

class SelfIntroductionItemController extends BaseController {
  // final SelfIntroductionService _selfIntroductionService = SelfIntroductionService();
  // final UserService _userService = UserService();
  // User get user => AuthService.to.user.value;
  //
  final Rx<SelfIntroduction> selfIntroduction = SelfIntroduction().obs;

  @override
  Future<void> onInit() async {
    selfIntroduction.value = Get.arguments['selfIntroduction'];
    super.onInit();
  }
}

