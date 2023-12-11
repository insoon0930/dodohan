import 'package:get/get.dart';

import '../../../../core/services/auth_service.dart';
import '../../../../routes/app_routes.dart';
import '../../../data/dto/admin_application.dart';
import '../../../data/model/user.dart';
import '../../../data/service/application_service/service.dart';

class ApplicationController extends GetxController {
  final ApplicationService applicationService = ApplicationService();
  final RxList<AdminApplication> applications = <AdminApplication>[].obs;
  User get user => AuthService.to.user.value;

  @override
  Future<void> onInit() async {
    if(!AuthService.to.isAdmin) {
      Get.offAllNamed(Routes.loginBy);
      return;
    }
    applications.value = await applicationService.findThisWeeks();
    super.onInit();
  }
}
