import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
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
    final DateTime matchTime =
        TimeUtility.todaySimple().subtract(const Duration(minutes: 5));
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection('match_result')
          .where(isMan ? 'man' : 'woman', isEqualTo: user)
          .where('createdAt', isGreaterThanOrEqualTo: matchTime)
          .get();
      return Match.fromJson(querySnapshot.docs.first.data() as Map<String, dynamic>);
    } catch (e) {
      return null;
    }
  }
}