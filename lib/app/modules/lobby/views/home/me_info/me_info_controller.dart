import 'package:dodohan/core/base_controller.dart';
import 'package:get/get.dart';
import '../../../../../../core/services/auth_service.dart';
import '../../../../../data/model/me_info.dart';
import '../../../../../data/model/user.dart';
import '../../../../../data/service/me_info_service/service.dart';

class MeInfoController extends BaseController {
  final MeInfoService _meInfoService = MeInfoService();

  Rx<MeInfo> meInfo = MeInfo().obs;

  User get user => AuthService.to.user.value;

  @override
  Future<void> onInit() async {
    meInfo.value = await _meInfoService.findOne(user.id);
    isLoading.value = false;
    super.onInit();
  }

  Future<void> updateMeInfo() async {
    await _meInfoService.updateOne(meInfo.value.id!, meInfo.value);
    meInfo.refresh();
    Get.back();
    return;
  }
}

