import '../../../data/provider/api_service.dart';
import '../../model/pg_bill.dart';

class PgBillRepository extends ApiService {

  PgBillRepository._privateConstructor();
  static final PgBillRepository _instance = PgBillRepository._privateConstructor();
  factory PgBillRepository() {
    return _instance;
  }

  Future<void> create(PgBill pgBill) async {
    try {
      print('pgBill: $pgBill');
      final doc = firestore.collection('pgBills').doc();
      pgBill.id = doc.id;
      print('pgBill:1 $pgBill');
      print('pgBill:2 ${pgBill.toJson()}');
      await doc.set(pgBill.toJson());
      print('pgBill:3');
      return;
    } catch (e) {
      rethrow;
    }
  }
}