import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:stamp_now/app/data/enums.dart';

import '../../../../core/utils/time_utility.dart';
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
      final doc = firestore.collection('applications').doc();
      application.id = doc.id;
      doc.set(application.toJson());
      return application;
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
  Stream<int> getApplicantsNumStream() {
    final int thisWeekDay = DateTime.now().weekday;
    final DateTime today = TimeUtility.todaySimple();
    final DateTime lastFriday = today.subtract(Duration(days: today.weekday + 2));
    final DateTime thisFriday = today.subtract(Duration(days: today.weekday - DateTime.friday));
    // Replace 'applications' with your actual collection name
    CollectionReference<Map<String, dynamic>> collectionReference =
        firestore.collection('applications');

    // Create a query snapshot of the collection
    Stream<QuerySnapshot<Map<String, dynamic>>> stream = collectionReference
        .where('createdAt',
            isGreaterThanOrEqualTo:
                thisWeekDay < 5 ? lastFriday : thisFriday) // 필드 조건 설정
        .snapshots();

    // Transform the query snapshot stream to a stream of the document count
    return stream.map((snapshot) => snapshot.size);
  }

  Future<Application?> findThisWeekOne(String user) async {
    final int thisWeekDay = DateTime.now().weekday;
    final DateTime today = TimeUtility.todaySimple();
    final DateTime lastFriday = today.subtract(Duration(days: today.weekday + 2));
    final DateTime thisFriday = today.subtract(Duration(days: today.weekday - DateTime.friday));
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection('applications')
          .where('user', isEqualTo: user)
          .where('createdAt',
              isGreaterThanOrEqualTo: thisWeekDay < 5
                  ? lastFriday
                  : thisFriday)
          .get();
      // print('querySnapshot.docs.first.data(): ${querySnapshot.docs.first.data()}');
      return Application.fromJson(querySnapshot.docs.first.data() as Map<String, dynamic>);
    } catch (e) {
      print('error: $e');
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