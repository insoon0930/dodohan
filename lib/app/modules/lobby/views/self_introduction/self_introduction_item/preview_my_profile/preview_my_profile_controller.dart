import 'package:get/get.dart';
import '../../../../../../../core/base_controller.dart';
import '../../../../../../../core/services/auth_service.dart';
import '../../../../../../data/model/me_info.dart';
import '../../../../../../data/model/user.dart';
import '../../../../../../data/service/me_info_service/service.dart';

class PreviewMyProfileController extends BaseController {
  final MeInfoService _meInfoService = MeInfoService();
  User get user => AuthService.to.user.value;

  final Rx<MeInfo> meInfo = MeInfo().obs;

  @override
  Future<void> onInit() async {
    meInfo.value = await _meInfoService.findOne(user.id);
    super.onInit();
  }
}

