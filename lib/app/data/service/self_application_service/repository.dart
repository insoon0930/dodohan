
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dodohan/app/data/enums.dart';
import 'package:dodohan/core/utils/time_utility.dart';

import '../../../data/provider/api_service.dart';
import '../../model/self_application.dart';

class SelfApplicationRepository extends ApiService {
  SelfApplicationRepository._privateConstructor();

  static final SelfApplicationRepository _instance =
      SelfApplicationRepository._privateConstructor();

  factory SelfApplicationRepository() {
    return _instance;
  }

  Future<SelfApplication> create(SelfApplication selfApplication) async {
    try {
      final doc = firestore.collection('selfApplications').doc();
      selfApplication.id = doc.id;
      await doc.set(selfApplication.toJson());
      return selfApplication;
    } catch (e) {
      rethrow;
    }
  }
}
