import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stamp_now/app/widgets/dialogs/application_dialog.dart';
import '../../../core/services/auth_service.dart';
import '../../../routes/app_routes.dart';
import '../../data/model/me_info.dart';
import '../../data/model/user.dart';
import '../../data/model/you_info.dart';
import '../../data/service/application_service/service.dart';
import '../../data/service/me_info_service/service.dart';
import '../../data/service/you_info_service/service.dart';

class HomeController extends GetxController {
  final ApplicationService _applicationService = ApplicationService();
  final MeInfoService _meInfoService = MeInfoService();
  final YouInfoService _youInfoService = YouInfoService();
  User get user => AuthService.to.user.value;

  @override
  Future<void> onInit() async {
    //todo view 처리
    super.onInit();
  }

  Future<Map<String, dynamic>> getInfos() async {
    //todo 검증 1. 신청 가능 시간, 2. 신청서 작성 완료, 3. 신청한 기록 없는지
    MeInfo meInfo = await _meInfoService.findOne(user.id);
    YouInfo youInfo = await _youInfoService.findOne(user.id);
    return {'meInfo': meInfo, 'youInfo': youInfo};
  }

  Future<void> apply(MeInfo meInfo, YouInfo youInfo) async {
    await _applicationService.create(meInfo, youInfo);
    Get.back();
    Get.snackbar('신청 완료', '결과는 목요일 밤 12시에 공개됩니다!');
  }
}

