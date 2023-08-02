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

  findOne() {}


  // Future<Application?> findOne(String id) async {
  //   try {
  //     DocumentSnapshot applicationSnapshot = await firestore.collection('applications').doc(id).get();
  //     return Application.fromJson(applicationSnapshot.data() as Map<String, dynamic>);
  //   } catch (e) {
  //     return null;
  //   }
  // }
  //

  Future<Application?> findThisWeekOne(String user) async {
    final int thisWeekDay = DateTime.now().weekday;
    final DateTime today = DateTime(DateTime.now().year, DateTime.now().month);
    final DateTime lastFriday = today.subtract(Duration(days: today.weekday + 2));
    final DateTime thisFriday = today.subtract(Duration(days: today.weekday - DateTime.friday));
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection('applications')
          .where('user', isEqualTo: user)
          .where('createdAt',
              isGreaterThanOrEqualTo: thisWeekDay < 5
                  ? lastFriday.toIso8601String()
                  : thisFriday.toIso8601String())
          .get();
      print('querySnapshot.docs.first.data(): ${querySnapshot.docs.first.data()}');
      return Application.fromJson(querySnapshot.docs.first.data() as Map<String, dynamic>);
    } catch (e) {
      return null;
    }
  }
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