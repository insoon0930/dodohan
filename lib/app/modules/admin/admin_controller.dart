import 'package:get/get.dart';
import '../../../core/services/auth_service.dart';
import '../../data/eums.dart';
import '../../data/model/identity.dart';
import '../../data/model/user.dart';
import '../../data/service/identity_service/service.dart';
import '../../data/service/user_service/service.dart';

class AdminController extends GetxController {
  final IdentityService identityService = IdentityService();
  final UserService userService = UserService();

  final RxList<Identity> waitingIds = <Identity>[].obs;
  User get user => AuthService.to.user.value;


  @override
  Future<void> onInit() async {
    waitingIds.value = await identityService.findWaiting();
    super.onInit();
  }

  Future<void> updateStatus(Identity identity, IdStatus status) async {
    await identityService.updateStatus(identity.id, status);
    waitingIds.removeWhere((item) => item.id == identity.id);
    userService.updateIdStatus(identity.user, status);
  }

}

