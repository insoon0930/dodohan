import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dodohan/app/data/enums.dart';
import 'package:dodohan/core/utils/time_utility.dart';

import '../../../data/provider/api_service.dart';
import '../../model/self_application.dart';
import '../../model/self_introduction.dart';

class SelfIntroductionRepository extends ApiService {
  SelfIntroductionRepository._privateConstructor();

  static final SelfIntroductionRepository _instance = SelfIntroductionRepository._privateConstructor();

  factory SelfIntroductionRepository() {
    return _instance;
  }

  Future<SelfIntroduction> create(SelfIntroduction selfIntroduction) async {
    try {
      final doc = firestore.collection('selfIntroductions').doc();
      selfIntroduction.id = doc.id;
      await doc.set(selfIntroduction.toJson());
      return selfIntroduction;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addSelfApplication(String selfIntroId, SelfApplication selfApplication) async {
    try {
      final doc = firestore.collection('selfIntroductions').doc(selfIntroId);
      await doc.update({'applications': FieldValue.arrayUnion([selfApplication.toJson()])});
      return;
    } catch (e) {
      rethrow;
    }
  }
}