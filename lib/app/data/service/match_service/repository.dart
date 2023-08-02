import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:stamp_now/app/data/enums.dart';

import '../../../data/provider/api_service.dart';
import '../../model/match.dart';
class MatchRepository extends ApiService {

  MatchRepository._privateConstructor();
  static final MatchRepository _instance = MatchRepository._privateConstructor();
  factory MatchRepository() {
    return _instance;
  }

  Future<Match?> findOne(String user) async {
    final DateTime today = DateTime(DateTime.now().year, DateTime.now().month);
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection('matches')
          .where('user', isEqualTo: user)
          .where('createdAt', isGreaterThanOrEqualTo: today.toIso8601String())
          .get();
      return Match.fromJson(querySnapshot.docs.first.data() as Map<String, dynamic>);
    } catch (e) {
      return null;
    }
  }


  Future<Match?> findThisWeekOne(String user) async {
    final int thisWeekDay = DateTime.now().weekday;
    final DateTime today = DateTime(DateTime.now().year, DateTime.now().month);
    final DateTime lastFriday = today.subtract(Duration(days: today.weekday + 2));
    final DateTime thisFriday = today.subtract(Duration(days: today.weekday - DateTime.friday));
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection('matches')
          .where('user', isEqualTo: user)
          .where('createdAt',
              isGreaterThanOrEqualTo: thisWeekDay < 5
                  ? lastFriday.toIso8601String()
                  : thisFriday.toIso8601String())
          .get();
      print('querySnapshot.docs.first.data(): ${querySnapshot.docs.first.data()}');
      return Match.fromJson(querySnapshot.docs.first.data() as Map<String, dynamic>);
    } catch (e) {
      return null;
    }
  }
  //
  // Future<void> updateStatus(String id, IdStatus idStatus) async {
  //   try {
  //     final DocumentReference ref = firestore.collection('matches').doc(id);
  //     await ref.update({'status': idStatus.name});
  //     return;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}