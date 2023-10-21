import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dodohan/app/data/enums.dart';
import 'package:dodohan/core/utils/time_utility.dart';

import '../../../data/provider/api_service.dart';
import '../../model/daily_card.dart';

class DailyCardRepository extends ApiService {
  DailyCardRepository._privateConstructor();

  static final DailyCardRepository _instance =
      DailyCardRepository._privateConstructor();

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
      return myCardsSnapShot.docs
          .map((e) => DailyCard.fromJson(e.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<DailyCard>> findSent(String user) async {
    try {
      final today = await _findSentByDate(user, date: TimeUtility.todayWithSlash());
      final yesterday = await _findSentByDate(user, date: TimeUtility.todayWithSlash(subtractDay: 1));
      final dayBeforeYesterday = await _findSentByDate(user, date: TimeUtility.todayWithSlash(subtractDay: 2));
      return [...today, ...yesterday, ...dayBeforeYesterday];
    } catch (e) {
      return [];
    }
  }

  Future<List<DailyCard>> findReceived(String user) async {
    try {
      final today = await _findReceivedByDate(user, date: TimeUtility.todayWithSlash());
      final yesterday = await _findReceivedByDate(user, date: TimeUtility.todayWithSlash(subtractDay: 1));
      final dayBeforeYesterday = await _findReceivedByDate(user, date: TimeUtility.todayWithSlash(subtractDay: 2));
      return [...today, ...yesterday, ...dayBeforeYesterday];
    } catch (e) {
      return [];
    }
  }

  Future<void> updateMeStatus(String dailyCardId, CardStatus status) async {
    try {
      final DocumentReference todayCardsRef =
          firestore.collection('dailyCards').doc(TimeUtility.todayWithSlash());
      final DocumentReference dailyCardDocRef =
          todayCardsRef.collection('cards').doc(dailyCardId);
      await dailyCardDocRef.update({'meStatus': status.name});
      return;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateYouStatus(String dailyCardId, CardStatus status) async {
    try {
      final DocumentReference todayCardsRef =
          firestore.collection('dailyCards').doc(TimeUtility.todayWithSlash());
      final DocumentReference dailyCardDocRef =
          todayCardsRef.collection('cards').doc(dailyCardId);
      await dailyCardDocRef.update({'youStatus': status.name});
      return;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<DailyCard>> _findSentByDate(String user, {required String date}) async {
    try {
      final DocumentReference todayCardsRef = firestore.collection('dailyCards').doc(date);
      final QuerySnapshot myCardsSnapShot = await todayCardsRef
          .collection('cards')
          .where('meInfo.user', isEqualTo: user)
          .where('meStatus', whereNotIn: [CardStatus.unChecked.name, CardStatus.checked.name])
          .get();
      return myCardsSnapShot.docs
          .map((e) => DailyCard.fromJson(e.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<DailyCard>> _findReceivedByDate(String user, {required String date}) async {
    try {
      final DocumentReference todayCardsRef = firestore.collection('dailyCards').doc(date);
      final QuerySnapshot myCardsSnapShot = await todayCardsRef
          .collection('cards')
          .where('youInfo.user', isEqualTo: user)
          .where('meStatus', whereNotIn: [CardStatus.unChecked.name, CardStatus.checked.name])
          .get();
      return myCardsSnapShot.docs
          .map((e) => DailyCard.fromJson(e.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      return [];
    }
  }
}
