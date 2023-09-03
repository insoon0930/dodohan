import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stamp_now/app/data/enums.dart';
import 'package:stamp_now/core/utils/time_utility.dart';

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
      DocumentReference todayCardsRef =
          firestore.collection('dailyCards').doc(TimeUtility.todayWithSlash());
      QuerySnapshot myCardsSnapShot = await todayCardsRef
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
  // Future<void> updateStatus(String id, IdStatus idStatus) async {
  //   try {
  //     final DocumentReference ref = firestore.collection('identities').doc(id);
  //     await ref.update({'status': idStatus.name});
  //     return;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}