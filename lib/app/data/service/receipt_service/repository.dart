import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dodohan/app/data/model/receipt.dart';

import '../../../data/provider/api_service.dart';
import '../../model/coin_receipt.dart';

class ReceiptRepository extends ApiService {

  ReceiptRepository._privateConstructor();
  static final ReceiptRepository _instance = ReceiptRepository._privateConstructor();
  factory ReceiptRepository() {
    return _instance;
  }

  Future<List<Receipt>> find(String user) async {
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection('receipts')
          .where('customer', isEqualTo: user)
          .get();
      return querySnapshot.docs.map((e) => Receipt.fromJson(e.data() as Map<String, dynamic>)).toList();
    } catch (e) {
      return [];
    }
  }
}