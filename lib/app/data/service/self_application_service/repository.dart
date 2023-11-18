
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

  Future<SelfApplication?> findOne(String selfIntroductionId, String applicant) async {
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection('selfApplications')
          .where('selfIntroductionId', isEqualTo: selfIntroductionId)
          .where('meInfo.user', isEqualTo: applicant)
          .get();
      if(querySnapshot.docs.isEmpty) return null;
      return SelfApplication.fromJson(querySnapshot.docs.first.data());
    } catch (e) {
      rethrow;
    }
  }

  Future<List<SelfApplication>> findMany(String selfIntroductionId) async {
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection('selfApplications')
          .where('selfIntroductionId', isEqualTo: selfIntroductionId)
          .orderBy('createdAt', descending: true)
          .get();
      return querySnapshot.docs.map((e) => SelfApplication.fromJson(e.data())).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<SelfApplication> updateStatus(String selfApplicationId, SelfApplicationStatus status) async {
    try {
      final DocumentReference ref = firestore.collection('selfApplications').doc(selfApplicationId);
      await ref.update({'status': status.name});
      final selfApplicationSnapshot = await ref.get();
      return SelfApplication.fromJson(selfApplicationSnapshot.data());
    } catch (e) {
      rethrow;
    }
  }
}
