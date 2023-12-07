import 'package:get/get.dart';
import '../../../data/service/user_service/service.dart';

class LoginByController extends GetxController {
  final UserService userService = UserService();

  final RxInt manNum = 0.obs;
  final RxInt womanNum = 0.obs;
  final RxDouble genderRatio = 0.0.obs;

  @override
  Future<void> onInit() async {
    print('LoginByController onInit');
    Map<String, int> userNum = await userService.findUserNumIncludeDeleted();
    manNum.value = userNum['manNum']!;
    womanNum.value = userNum['womanNum']!;
    genderRatio.value = manNum.value / womanNum.value;
    super.onInit();
  }
}
