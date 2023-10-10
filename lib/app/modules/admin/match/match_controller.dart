import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dodohan/app/data/model/image_update_request.dart';

import '../../../../core/services/auth_service.dart';
import '../../../../routes/app_routes.dart';
import '../../../data/dto/admin_match.dart';
import '../../../data/model/user.dart';
import '../../../data/service/image_update_request_service/service.dart';
import '../../../data/service/match_service/service.dart';
import '../../../data/model/match.dart';

class MatchController extends GetxController {
  final MatchService matchService = MatchService();

  final RxList<AdminMatch> matchProfiles = <AdminMatch>[].obs;
  User get user => AuthService.to.user.value;

  @override
  Future<void> onInit() async {
    if(user.phoneNum != '+821066192550') {
      Get.offAllNamed(Routes.loginBy);
      return;
    }

    matchProfiles.value = await matchService.findTwoWeeks();
    super.onInit();
  }
}
