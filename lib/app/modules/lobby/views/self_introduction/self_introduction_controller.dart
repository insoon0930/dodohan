import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dodohan/app/data/provider/api_service.dart';
import 'package:dodohan/app/widgets/dialogs/action_dialog.dart';
import 'package:get/get.dart';
import 'package:dodohan/app/modules/splash/splash_controller.dart';
import '../../../../../core/base_controller.dart';
import '../../../../../core/services/auth_service.dart';
import '../../../../../core/services/push_service.dart';
import '../../../../../routes/app_routes.dart';
import '../../../../data/enums.dart';
import '../../../../data/model/daily_card.dart';
import '../../../../data/model/self_introduction.dart';
import '../../../../data/model/user.dart';
import '../../../../data/service/daily_card_service/service.dart';
import '../../../../data/service/self_introduction_service/service.dart';

class SelfIntroductionController extends BaseController {
  final ApiService apiService = Get.find();
  final SelfIntroductionService _selfIntroductionService = SelfIntroductionService();
  User get user => AuthService.to.user.value;

  List<String> choices = ['전체', ...regionFilter.values.toSet()];
  Rxn<Query> docs = Rxn<Query>();
  RxnBool isManAdminSwitch = RxnBool();

  @override
  Future<void> onInit() async {
    print('SelfIntroductionController onInit');
    docs.value = apiService.firestore
        .collection('selfIntroductions')
        .where('createdAt', isGreaterThanOrEqualTo: DateTime.now().subtract(const Duration(days: 7)))
        .where('meInfo.isMan', isEqualTo: isManAdminSwitch.value ?? user.isMan! ? false : true)
        .where('deletedAt', isNull: true)
        .orderBy('createdAt', descending: true);
    super.onInit();
  }

  void onFilterChanged(String value) async {
    if(value == '전체') {
      docs.value = apiService.firestore
          .collection('selfIntroductions')
          .where('createdAt', isGreaterThanOrEqualTo: DateTime.now().subtract(const Duration(days: 7)))
          .where('meInfo.isMan', isEqualTo: user.isMan! ? false : true)
          .where('deletedAt', isNull: true)
          .orderBy('createdAt', descending: true);
    } else {
      docs.value = apiService.firestore
          .collection('selfIntroductions')
          .where('region', isEqualTo: value)
          .where('createdAt', isGreaterThanOrEqualTo: DateTime.now().subtract(const Duration(days: 7)))
          .where('meInfo.isMan', isEqualTo: user.isMan! ? false : true)
          .where('deletedAt', isNull: true)
          .orderBy('createdAt', descending: true);
    }
  }

  void switchIsMan(bool val) {
    isManAdminSwitch.value = val;
    onInit();
  }

  void showDeleteDialog(SelfIntroduction selfIntroduction) {
    Get.dialog(ActionDialog(title: '삭제하기', text: '삭제하시겠습니까?', confirmCallback: () async {
      showLoading();
      await _selfIntroductionService.delete(selfIntroduction.id);
      hideLoading();
      FcmService.to.sendFcmPush(selfIntroduction.meInfo!.user!, FcmPushType.selfIntroductionDeletedByAdmin);
      Get.snackbar('삭제 완료', '셀프 소개 삭제를 완료했습니다');
    }));
  }
}

