import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../data/provider/api_service.dart';
import '../../model/coin_receipt.dart';

class CoinReceiptRepository extends ApiService {

  CoinReceiptRepository._privateConstructor();
  static final CoinReceiptRepository _instance = CoinReceiptRepository._privateConstructor();
  factory CoinReceiptRepository() {
    return _instance;
  }

  Future<void> create(CoinReceipt coinReceipt) async {
    try {
      final doc = firestore.collection('coinReceipts').doc();
      coinReceipt.id = doc.id;
      await doc.set(coinReceipt.toJson());
      return;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<CoinReceipt>> findByUserId(String userId) async {
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection('coinReceipts')
          .where('user', isEqualTo: userId)
          .orderBy('createdAt', descending: true)
          .limit(10)
          .get();
      return querySnapshot.docs.map((e) => CoinReceipt.fromJson(e.data() as Map<String, dynamic>)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<CoinReceipt>> findAllDailyRewards() async {
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection('coinReceipts')
          .where('type', isEqualTo: 'dailyReward')
          .get();
      return querySnapshot.docs.map((e) => CoinReceipt.fromJson(e.data() as Map<String, dynamic>)).toList();
    } catch (e) {
      return [];
    }
  }

}