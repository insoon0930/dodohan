import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dodohan/app/data/model/receipt.dart';

import '../../../data/provider/api_service.dart';

class ReceiptRepository extends ApiService {

  ReceiptRepository._privateConstructor();
  static final ReceiptRepository _instance = ReceiptRepository._privateConstructor();
  factory ReceiptRepository() {
    return _instance;
  }

  Future<List<Receipt>> findAll() async {
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection('receipts')
          .get();
      return querySnapshot.docs.map((e) => Receipt.fromJson(e.data() as Map<String, dynamic>)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<Receipt>> findByBuyerId(String userId) async {
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection('receipts')
          .where('buyer', isEqualTo: userId)
          .orderBy('createdAt', descending: true)
          .limit(3)
          .get();
      return querySnapshot.docs.map((e) => Receipt.fromJson(e.data() as Map<String, dynamic>)).toList();
    } catch (e) {
      return [];
    }
  }

}