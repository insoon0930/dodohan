
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dodohan/app/data/enums.dart';
import 'package:dodohan/core/utils/time_utility.dart';

import '../../../data/provider/api_service.dart';
import '../../model/self_introduction.dart';

class SelfIntroductionRepository extends ApiService {
  SelfIntroductionRepository._privateConstructor();

  static final SelfIntroductionRepository _instance =
      SelfIntroductionRepository._privateConstructor();

  factory SelfIntroductionRepository() {
    return _instance;
  }

  Future<List<SelfIntroduction>> findToday(String user) async {
    try {
      final DocumentReference todayCardsRef =
          firestore.collection('selfIntroductions').doc(TimeUtility.todayWithSlash());
      final QuerySnapshot myCardsSnapShot = await todayCardsRef
          .collection('cards')
          .where('meInfo.user', isEqualTo: user)
          .get();
      return myCardsSnapShot.docs
          .map((e) => SelfIntroduction.fromJson(e.data()))
          .toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<SelfIntroduction>> findSent(String user) async {
    try {
      final today = await _findSentByDate(user, date: TimeUtility.todayWithSlash());
      final yesterday = await _findSentByDate(user, date: TimeUtility.todayWithSlash(subtractDay: 1));
      final dayBeforeYesterday = await _findSentByDate(user, date: TimeUtility.todayWithSlash(subtractDay: 2));
      return [...today, ...yesterday, ...dayBeforeYesterday];
    } catch (e) {
      return [];
    }
  }

  Future<List<SelfIntroduction>> findReceived(String user) async {
    try {
      final today = await _findReceivedByDate(user, date: TimeUtility.todayWithSlash());
      final yesterday = await _findReceivedByDate(user, date: TimeUtility.todayWithSlash(subtractDay: 1));
      final dayBeforeYesterday = await _findReceivedByDate(user, date: TimeUtility.todayWithSlash(subtractDay: 2));
      return [...today, ...yesterday, ...dayBeforeYesterday];
    } catch (e) {
      return [];
    }
  }

  Future<SelfIntroduction> updateMeStatus(SelfIntroduction selfIntroduction, CardStatus status) async {
    try {
      final DocumentReference todayCardsRef =
          firestore.collection('selfIntroductions').doc(TimeUtility.todayWithSlash(subtractDay: selfIntroduction.differenceInDays));
      final DocumentReference selfIntroductionDocRef = todayCardsRef.collection('cards').doc(selfIntroduction.id);
      await selfIntroductionDocRef.update({'meStatus': status.name});
      final updatedSelfIntroduction = await selfIntroductionDocRef.get();
      return SelfIntroduction.fromJson(updatedSelfIntroduction.data());
    } catch (e) {
      rethrow;
    }
  }

  Future<SelfIntroduction> updateYouStatus(SelfIntroduction selfIntroduction, CardStatus status) async {
    try {
      final DocumentReference todayCardsRef =
          firestore.collection('selfIntroductions').doc(TimeUtility.todayWithSlash(subtractDay: selfIntroduction.differenceInDays));
      final DocumentReference selfIntroductionDocRef = todayCardsRef.collection('cards').doc(selfIntroduction.id);
      await selfIntroductionDocRef.update({'youStatus': status.name});
      final updatedSelfIntroduction = await selfIntroductionDocRef.get();
      return SelfIntroduction.fromJson(updatedSelfIntroduction.data());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateBlock(SelfIntroduction selfIntroduction) async {
    try {
      final DocumentReference todayCardsRef =
        firestore.collection('selfIntroductions').doc(TimeUtility.todayWithSlash(subtractDay: selfIntroduction.differenceInDays));
      final DocumentReference selfIntroductionDocRef =
        todayCardsRef.collection('cards').doc(selfIntroduction.id);
      // if (selfIntroduction.iAmMe) {
      //   await selfIntroductionDocRef.update({'meBlockedYou': true});
      // } else {
      //   await selfIntroductionDocRef.update({'youBlockedMe': true});
      // }
      return;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<SelfIntroduction>> _findSentByDate(String user, {required String date}) async {
    try {
      final DocumentReference todayCardsRef = firestore.collection('selfIntroductions').doc(date);
      final QuerySnapshot myCardsSnapShot = await todayCardsRef
          .collection('cards')
          .where('meInfo.user', isEqualTo: user)
          .where('meStatus', whereNotIn: [CardStatus.unChecked.name, CardStatus.checked.name])
          .where('meBlockedYou', isEqualTo: false)
          .get();
      return myCardsSnapShot.docs
          .map((e) => SelfIntroduction.fromJson(e.data()))
          .toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<SelfIntroduction>> _findReceivedByDate(String user, {required String date}) async {
    try {
      final DocumentReference todayCardsRef = firestore.collection('selfIntroductions').doc(date);
      final QuerySnapshot myCardsSnapShot = await todayCardsRef
          .collection('cards')
          .where('youInfo.user', isEqualTo: user)
          .where('meStatus', whereNotIn: [CardStatus.unChecked.name, CardStatus.checked.name])
          .where('meBlockedYou', isEqualTo: false)
          .get();
      return myCardsSnapShot.docs
          .map((e) => SelfIntroduction.fromJson(e.data()))
          .toList();
    } catch (e) {
      return [];
    }
  }
}
