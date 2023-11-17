
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../../../core/base_controller.dart';
import '../../../../../../core/services/auth_service.dart';
import '../../../../../../routes/app_routes.dart';
import '../../../../../data/enums.dart';
import '../../../../../data/model/daily_card.dart';
import '../../../../../data/model/user.dart';
import '../../../../../data/provider/api_service.dart';
import '../../../../../data/service/daily_card_service/service.dart';
import '../../../../../data/service/self_introduction_service/service.dart';

class MySelfIntroductionController extends BaseController {
  final ApiService apiService = Get.find();
  User get user => AuthService.to.user.value;

  List<String> choices = ['전체', ...regionFilter.values.toSet()];
  Rxn<Query> sentDocs = Rxn<Query>();
  Rxn<Query> madeDocs = Rxn<Query>();

  @override
  Future<void> onInit() async {
    print('SelfIntroductionController onInit');
    sentDocs.value = apiService.firestore
        .collection('selfIntroductions')
        .where('createdAt', isGreaterThanOrEqualTo: DateTime.now().subtract(const Duration(days: 7)))
        .where('applicants', arrayContains: user.id)
        .orderBy('createdAt', descending: true);
    madeDocs.value = apiService.firestore
        .collection('selfIntroductions')
        .where('createdAt', isGreaterThanOrEqualTo: DateTime.now().subtract(const Duration(days: 7)))
        .where('meInfo.user', isEqualTo: user.id)
        .orderBy('createdAt', descending: true);
    super.onInit();
  }
}

