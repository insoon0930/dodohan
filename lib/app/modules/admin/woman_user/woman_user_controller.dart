import 'package:get/get.dart';

import '../../../../core/services/auth_service.dart';
import '../../../../routes/app_routes.dart';
import '../../../data/model/user.dart';
import '../../../data/service/user_service/service.dart';

class WomanUserController extends GetxController {
  final UserService userService = UserService();

  //여성 유저 리스트
  final RxList<User> womanUsers = <User>[].obs;
  final RxInt manNum = 1.obs;
  final RxInt womanNum = 1.obs;
  final RxInt deletedManNum = 0.obs;
  final RxInt deletedWomanNum = 0.obs;
  User get user => AuthService.to.user.value;
  int get allUserNum => manNum.value + womanNum.value;
  String get genderRatio => '${(manNum.value / womanNum.value).toStringAsFixed(2)} : 1';


  @override
  Future<void> onInit() async {
    if(!AuthService.to.isAdmin) {
      Get.offAllNamed(Routes.loginBy);
      return;
    }
    womanUsers.value = await userService.findWomen();
    Map<String, int> userNum = await userService.findUserNum();
    manNum.value = userNum['manNum']!;
    womanNum.value = userNum['womanNum']!;
    Map<String, int> deletedUserNum = await userService.findUserNum(isDeleted: true);
    deletedManNum.value = deletedUserNum['manNum']!;
    deletedWomanNum.value = deletedUserNum['womanNum']!;
    super.onInit();
  }
}
