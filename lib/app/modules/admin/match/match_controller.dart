import 'package:get/get.dart';

import '../../../../core/services/auth_service.dart';
import '../../../../routes/app_routes.dart';
import '../../../data/dto/admin_match.dart';
import '../../../data/model/user.dart';
import '../../../data/service/match_service/service.dart';

class MatchController extends GetxController {
  final MatchService matchService = MatchService();

  final RxList<AdminMatch> matchProfiles = <AdminMatch>[].obs;
  User get user => AuthService.to.user.value;

  @override
  Future<void> onInit() async {
    if(!AuthService.to.isAdmin) {
      Get.offAllNamed(Routes.loginBy);
      return;
    }

    matchProfiles.value = await matchService.findTwoWeeks();
    super.onInit();
  }
}
