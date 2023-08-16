import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stamp_now/app/data/enums.dart';
import '../../../../core/utils/time_utility.dart';
import '../../../data/provider/api_service.dart';
import '../../model/match.dart';
class MatchRepository extends ApiService {

  MatchRepository._privateConstructor();
  static final MatchRepository _instance = MatchRepository._privateConstructor();
  factory MatchRepository() {
    return _instance;
  }

  Future<Match?> findOne(String user, bool isMan) async {
    final DateTime matchTime = TimeUtility.todaySimple().subtract(const Duration(minutes: 5));
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection('matches')
          .where(isMan ? 'man' : 'woman', isEqualTo: user)
          .where('createdAt', isGreaterThanOrEqualTo: matchTime)
          .get();
      return Match.fromJson(querySnapshot.docs.first.data() as Map<String, dynamic>);
    } catch (e) {
      print('match findOne error: $e');
      return null;
    }
  }

  Future<List<Match>> findTwoWeeks() async {
    final DateTime matchTime = TimeUtility.todaySimple().subtract(const Duration(days: 7, minutes: 5));
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection('matches')
          .where('createdAt', isGreaterThanOrEqualTo: matchTime)
          .get();
      return querySnapshot.docs.map((e) => Match.fromJson(e.data() as Map<String, dynamic>)).toList();
    } catch (e) {
      print('findTwoWeeks error: $e');
      return [];
    }
  }

  Future<void> updateMatchStatus(String docId, bool isMan, MatchStatus newStatus) async {
    try {
      await firestore.collection('matches').doc(docId).update(isMan ? {
        'manStatus': newStatus.name,
      } : {
        'womanStatus': newStatus.name,
      });
    } catch (e) {
      print('updateMatchStatus error: $e');
      return;
    }
  }


  // Future<void> updateOne(String docId, YouInfo newYouInfo) async {
  //   try {
  //     DocumentReference identityRef = firestore.collection('youInfos').doc(docId);
  //     await identityRef.set(newYouInfo.toJson());
  //     return;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}