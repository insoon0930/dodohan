import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:stamp_now/app/data/enums.dart';

import '../../../data/provider/api_service.dart';
import '../../model/application.dart';
class ApplicationRepository extends ApiService {

  ApplicationRepository._privateConstructor();
  static final ApplicationRepository _instance = ApplicationRepository._privateConstructor();
  factory ApplicationRepository() {
    return _instance;
  }

  Future<Application> create(Application application) async {
    try {
      final ref = await firestore.collection('applications').add(application.toJson());
      await ref.update({'id': ref.id});
      final snapshot = await ref.get();
      return Application.fromJson(snapshot.data()!);
    } catch (e) {
      rethrow;
    }
  }

  // Future<Application?> findOne(String id) async {
  //   try {
  //     DocumentSnapshot applicationSnapshot = await firestore.collection('applications').doc(id).get();
  //     return Application.fromJson(applicationSnapshot.data() as Map<String, dynamic>); //되나?
  //   } catch (e) {
  //     return null;
  //   }
  // }
  //
  // Future<List<Application>> findWaiting() async {
  //   try {
  //     QuerySnapshot querySnapshot = await firestore
  //         .collection('applications')
  //         .where('status', isEqualTo: IdStatus.waiting.name)
  //         .get();
  //     return querySnapshot.docs.map((e) => Application.fromJson(e.data() as Map<String, dynamic>)).toList();
  //   } catch (e) {
  //     return [];
  //   }
  // }
  //
  // Future<void> updateStatus(String id, IdStatus idStatus) async {
  //   try {
  //     final DocumentReference ref = firestore.collection('applications').doc(id);
  //     await ref.update({'status': idStatus.name});
  //     return;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}