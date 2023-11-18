
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dodohan/app/widgets/dialogs/error_dialog.dart';
import 'package:get/get.dart';

import '../../../../../../core/base_controller.dart';
import '../../../../../../core/services/auth_service.dart';
import '../../../../../../routes/app_routes.dart';
import '../../../../../data/enums.dart';
import '../../../../../data/model/self_introduction.dart';
import '../../../../../data/model/user.dart';
import '../../../../../data/provider/api_service.dart';

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
        .where('deletedAt', isNull: true)
        .orderBy('createdAt', descending: true);
    super.onInit();
  }

  void onTapCard(SelfIntroduction selfIntroduction) {
    if (selfIntroduction.deletedAt != null) {
      Get.dialog(const ErrorDialog(text: '삭제된 셀프 소개입니다'));
      return;
    }
    Get.toNamed(Routes.selfIntroductionItem, arguments: {'selfIntroduction': selfIntroduction});
  }
}

