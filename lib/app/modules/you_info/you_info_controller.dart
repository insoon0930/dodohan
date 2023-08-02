import 'package:get/get.dart';
import '../../../core/services/auth_service.dart';
import '../../data/model/user.dart';
import '../../data/model/you_info.dart';
import '../../data/service/you_info_service/service.dart';

class YouInfoController extends GetxController {
  final YouInfoService _youInfoService = YouInfoService();

  Rx<YouInfo> youInfo = YouInfo().obs;

  User get user => AuthService.to.user.value;

  @override
  Future<void> onInit() async {
    print('onInit user.id: ${user.id}');
    youInfo.value = await _youInfoService.findOne(user.id);
    print('onInit youInfo.value: ${youInfo.value}');
    super.onInit();
  }

  Future<void> updateYouInfo() async {
    await _youInfoService.updateOne(youInfo.value.id!, youInfo.value);
    Get.back();
    return;
  }
}

