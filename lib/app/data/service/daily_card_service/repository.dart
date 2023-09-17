import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stamp_now/app/data/enums.dart';
import 'package:stamp_now/core/services/auth_service.dart';
import 'package:stamp_now/core/utils/time_utility.dart';

import '../../../../core/services/auth_service.dart';
import '../../../data/provider/api_service.dart';
import '../../../modules/lobby/views/daily/widgets/card_item.dart';
import '../../model/daily_card.dart';
class DailyCardRepository extends ApiService {

  DailyCardRepository._privateConstructor();
  static final DailyCardRepository _instance = DailyCardRepository._privateConstructor();
  factory DailyCardRepository() {
    return _instance;
  }

  Future<List<DailyCard>> findToday(String user) async {
    try {
      final DocumentReference todayCardsRef =
          firestore.collection('dailyCards').doc(TimeUtility.todayWithSlash());
      final QuerySnapshot myCardsSnapShot = await todayCardsRef
          .collection('cards')
          .where('meInfo.user', isEqualTo: user)
          .get();
      return myCardsSnapShot.docs.map((e) => DailyCard.fromJson(e.data() as Map<String, dynamic>)).toList();
    } catch (e) {
      return [];
    }
  }

  // Future<DailyCard> findOneConfirmed(String user) async {
  //   try {
  //     QuerySnapshot querySnapshot = await firestore
  //         .collection('identities')
  //         .where('user', isEqualTo: user)
  //         .get();
  //     List<DailyCard> identities = querySnapshot.docs.map((e) => DailyCard.fromJson(e.data() as Map<String, dynamic>)).toList();
  //     return identities.firstWhere((e) => e.status == IdStatus.confirmed);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<List<DailyCard>> findWaiting() async {
  //   try {
  //     QuerySnapshot querySnapshot = await firestore
  //         .collection('identities')
  //         .where('status', isEqualTo: IdStatus.waiting.name)
  //         .get();
  //     return querySnapshot.docs.map((e) => DailyCard.fromJson(e.data() as Map<String, dynamic>)).toList();
  //   } catch (e) {
  //     return [];
  //   }
  // }
  //

  Future<void> updateMeStatus(String dailyCardId, MatchStatus status) async {
    try {
      final DocumentReference todayCardsRef =
          firestore.collection('dailyCards').doc(TimeUtility.todayWithSlash());
      final DocumentReference dailyCardDocRef = todayCardsRef
          .collection('cards')
          .doc(dailyCardId);
      await dailyCardDocRef.update({'meStatus' : status.name});
      return;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateYouStatus(String dailyCardId, MatchStatus status) async {
    try {
      final DocumentReference todayCardsRef =
        firestore.collection('dailyCards').doc(TimeUtility.todayWithSlash());
      final DocumentReference dailyCardDocRef = todayCardsRef
          .collection('cards')
          .doc(dailyCardId);
      await dailyCardDocRef.update({'youStatus' : status.name});
      return;
    } catch (e) {
      rethrow;
    }
  }
}