import 'package:get/get.dart';
import '../../../core/services/auth_service.dart';
import '../../data/model/me_info.dart';
import '../../data/model/user.dart';
import 'me_info_repository.dart';

class MeInfoController extends GetxController {
  final MeInfoRepository repo;
  final MeInfo meInfo = MeInfo();
  User get user => AuthService.to.user.value;
  MeInfoController({required this.repo});

  @override
  void onInit() {
    //tood MeInfo값 디비에서 찾아와보기
    super.onInit();
  }
}

