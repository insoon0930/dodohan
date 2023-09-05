import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/services/auth_service.dart';
import '../../data/model/daily_card.dart';
import '../../data/model/me_info.dart';
import '../../data/model/user.dart';
import '../../data/model/you_info.dart';
import '../../data/service/me_info_service/service.dart';

class DailyCardController extends GetxController {
  // final DailyCardService _dailyCardService = DailyCardService();

  Rx<DailyCard> dailyCard = DailyCard().obs;
  MeInfo get youInfo => dailyCard.value.youInfo!;
  User get user => AuthService.to.user.value;

  @override
  Future<void> onInit() async {
    print('DailyCardController OnInit started');
    dailyCard.value = Get.arguments;
    print('dailyCard.value: ${dailyCard.value}');
    super.onInit();
  }
  //
  // Future<void> updateDailyCard() async {
  //   await _dailyCardService.updateOne(dailyCard.value.id!, dailyCard.value);
  //   Get.back();
  //   return;
  // }
}

