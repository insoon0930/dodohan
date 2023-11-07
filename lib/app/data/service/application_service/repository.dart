import 'package:cloud_firestore/cloud_firestore.dart';

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
      await doc.set(application.toJson());
      return application;
    } catch (e) {
      rethrow;
    }
  }

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
              isGreaterThanOrEqualTo: thisWeekDay < 6
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

  Future<List<Application>> findThisWeekMany() async {
    final int thisWeekDay = DateTime.now().weekday;
    final DateTime today = TimeUtility.todaySimple();
    final DateTime lastFriday = today.subtract(Duration(days: today.weekday + 2));
    final DateTime thisFriday = today.subtract(Duration(days: today.weekday - DateTime.friday));
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection('applications')
          .where('meInfo.isMan', isEqualTo: false)
          .where('createdAt',
          isGreaterThanOrEqualTo: thisWeekDay < 6
              ? lastFriday
              : thisFriday)
          .get();

      List<Application> applications = querySnapshot.docs
          .map((e) => Application.fromJson(e.data() as Map<String, dynamic>))
          .toList();

      applications.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
      return applications;
    } catch (e) {
      print('findThisWeekMany error: $e');
      return [];
    }
  }

  Future<void> updateBodyShapeType() async {
    try {
      // 기존 데이터 가져오기
      QuerySnapshot<Map<String, dynamic>> snapshot = await firestore.collection('applications').get();

      // 기존 문자열 필드를 리스트로 변환하여 업데이트
      for (QueryDocumentSnapshot<Map<String, dynamic>> docSnapshot in snapshot.docs) {
        var oldStringField = docSnapshot.data()['youInfo']['bodyShape']; // 기존 문자열 필드 이름
        print('${docSnapshot.data()['youInfo']['bodyShape']}');

        final List<String> newStringListField;

        if (oldStringField == null || oldStringField.runtimeType != String) {
          continue;
        }

        // 리스트로 변환
        if(oldStringField == '상관없음') {
          final bool isMan = docSnapshot.data()['meInfo']['isMan'];
          if(isMan) {
            newStringListField = ['마른', '보통', '통통', '볼륨있는'];
          } else {
            newStringListField = ['마른', '보통', '통통', '근육있는'];
          }
        } else {
          newStringListField = [oldStringField];
        }
        print('newStringListField!!: $newStringListField');
        // 해당 문서 업데이트
        await firestore.collection('applications').doc(docSnapshot.id).update({
          'youInfo.bodyShape': newStringListField,
        });
      }
      return;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateIsRewarded(String applicationId) async {
    try {
      DocumentReference applicationRef = firestore.collection('applications').doc(applicationId);
      await applicationRef.update({'isRewarded': true});
      return;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteMany(String user) async {
    try {
      CollectionReference collection = firestore.collection('applications');
      QuerySnapshot<Object?> querySnapshot = await collection.where('user', isEqualTo: user).get();
      for (QueryDocumentSnapshot<Object?> docSnapshot in querySnapshot.docs) {
        await firestore.collection('applications').doc(docSnapshot.id).delete();
      }
      return;
    } catch (e) {
      rethrow;
    }
  }
}