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
      final doc = firestore.collection('pgBills').doc();
      pgBill.id = doc.id;
      await doc.set(pgBill.toJson());
      return;
    } catch (e) {
      rethrow;
    }
  }
}