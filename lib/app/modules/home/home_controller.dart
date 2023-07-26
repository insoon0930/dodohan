import 'package:get/get.dart';
import '../../../core/services/auth_service.dart';
import '../../data/model/user.dart';

class HomeController extends GetxController {
  User get user => AuthService.to.user.value;

  @override
  void onInit() {
    //tood MeInfo값 디비에서 찾아와보기
    super.onInit();
  }
}

