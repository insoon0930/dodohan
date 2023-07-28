import 'package:get/get.dart';
import '../../../core/services/auth_service.dart';
import '../../../routes/app_routes.dart';
import '../../data/model/user.dart';

class HomeController extends GetxController {
  User get user => AuthService.to.user.value;

  @override
  Future<void> onInit() async {
    //tood MeInfo값 디비에서 찾아와보기
    // await 1.delay();
    Get.toNamed(Routes.register);
    super.onInit();
  }
}

