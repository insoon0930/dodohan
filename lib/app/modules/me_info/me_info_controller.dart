import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/services/auth_service.dart';
import '../../data/model/me_info.dart';
import '../../data/model/user.dart';
import '../../data/service/me_info_service/service.dart';

class MeInfoController extends GetxController {
  final MeInfoService _meInfoService = MeInfoService();

  Rx<MeInfo> meInfo = MeInfo().obs;

  User get user => AuthService.to.user.value;

  @override
  Future<void> onInit() async {
    print('onInit user.id: ${user.id}');
    meInfo.value = await _meInfoService.findOne(user.id);
    print('onInit meInfo.value: ${meInfo.value}');
    super.onInit();
  }

  Future<void> updateMeInfo() async {
    await _meInfoService.updateOne(meInfo.value.id!, meInfo.value);
    Get.back();
    return;
  }
}

