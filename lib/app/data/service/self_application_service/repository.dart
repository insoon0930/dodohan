
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dodohan/app/data/enums.dart';
import 'package:dodohan/core/utils/time_utility.dart';

import '../../../data/provider/api_service.dart';
import '../../model/self_application.dart';

class SelfApplicationRepository extends ApiService {
  SelfApplicationRepository._privateConstructor();

  static final SelfApplicationRepository _instance =
      SelfApplicationRepository._privateConstructor();

  factory SelfApplicationRepository() {
    return _instance;
  }

  Future<List<SelfApplication>> findToday(String user) async {
    try {
      final DocumentReference todayCardsRef =
          firestore.collection('selfApplications').doc(TimeUtility.todayWithSlash());
      final QuerySnapshot myCardsSnapShot = await todayCardsRef
          .collection('cards')
          .where('meInfo.user', isEqualTo: user)
          .get();
      return myCardsSnapShot.docs
          .map((e) => SelfApplication.fromJson(e.data()))
          .toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<SelfApplication>> findSent(String user) async {
    try {
      final today = await _findSentByDate(user, date: TimeUtility.todayWithSlash());
      final yesterday = await _findSentByDate(user, date: TimeUtility.todayWithSlash(subtractDay: 1));
      final dayBeforeYesterday = await _findSentByDate(user, date: TimeUtility.todayWithSlash(subtractDay: 2));
      return [...today, ...yesterday, ...dayBeforeYesterday];
    } catch (e) {
      return [];
    }
  }

  Future<List<SelfApplication>> findReceived(String user) async {
    try {
      final today = await _findReceivedByDate(user, date: TimeUtility.todayWithSlash());
      final yesterday = await _findReceivedByDate(user, date: TimeUtility.todayWithSlash(subtractDay: 1));
      final dayBeforeYesterday = await _findReceivedByDate(user, date: TimeUtility.todayWithSlash(subtractDay: 2));
      return [...today, ...yesterday, ...dayBeforeYesterday];
    } catch (e) {
      return [];
    }
  }

  Future<SelfApplication> updateMeStatus(SelfApplication selfApplication, CardStatus status) async {
    try {
      final DocumentReference todayCardsRef =
          firestore.collection('selfApplications').doc(TimeUtility.todayWithSlash(subtractDay: selfApplication.differenceInDays));
      final DocumentReference selfApplicationDocRef = todayCardsRef.collection('cards').doc(selfApplication.id);
      await selfApplicationDocRef.update({'meStatus': status.name});
      final updatedSelfApplication = await selfApplicationDocRef.get();
      return SelfApplication.fromJson(updatedSelfApplication.data());
    } catch (e) {
      rethrow;
    }
  }

  Future<SelfApplication> updateYouStatus(SelfApplication selfApplication, CardStatus status) async {
    try {
      final DocumentReference todayCardsRef =
          firestore.collection('selfApplications').doc(TimeUtility.todayWithSlash(subtractDay: selfApplication.differenceInDays));
      final DocumentReference selfApplicationDocRef = todayCardsRef.collection('cards').doc(selfApplication.id);
      await selfApplicationDocRef.update({'youStatus': status.name});
      final updatedSelfApplication = await selfApplicationDocRef.get();
      return SelfApplication.fromJson(updatedSelfApplication.data());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateBlock(SelfApplication selfApplication) async {
    try {
      final DocumentReference todayCardsRef =
        firestore.collection('selfApplications').doc(TimeUtility.todayWithSlash(subtractDay: selfApplication.differenceInDays));
      final DocumentReference selfApplicationDocRef =
        todayCardsRef.collection('cards').doc(selfApplication.id);
      // if (selfApplication.iAmMe) {
      //   await selfApplicationDocRef.update({'meBlockedYou': true});
      // } else {
      //   await selfApplicationDocRef.update({'youBlockedMe': true});
      // }
      return;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<SelfApplication>> _findSentByDate(String user, {required String date}) async {
    try {
      final DocumentReference todayCardsRef = firestore.collection('selfApplications').doc(date);
      final QuerySnapshot myCardsSnapShot = await todayCardsRef
          .collection('cards')
          .where('meInfo.user', isEqualTo: user)
          .where('meStatus', whereNotIn: [CardStatus.unChecked.name, CardStatus.checked.name])
          .where('meBlockedYou', isEqualTo: false)
          .get();
      return myCardsSnapShot.docs
          .map((e) => SelfApplication.fromJson(e.data()))
          .toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<SelfApplication>> _findReceivedByDate(String user, {required String date}) async {
    try {
      final DocumentReference todayCardsRef = firestore.collection('selfApplications').doc(date);
      final QuerySnapshot myCardsSnapShot = await todayCardsRef
          .collection('cards')
          .where('youInfo.user', isEqualTo: user)
          .where('meStatus', whereNotIn: [CardStatus.unChecked.name, CardStatus.checked.name])
          .where('meBlockedYou', isEqualTo: false)
          .get();
      return myCardsSnapShot.docs
          .map((e) => SelfApplication.fromJson(e.data()))
          .toList();
    } catch (e) {
      return [];
    }
  }
}
