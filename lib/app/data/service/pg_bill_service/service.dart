import 'package:dodohan/app/data/service/pg_bill_service/repository.dart';
import '../../model/pg_bill.dart';
import '../../provider/api_service.dart';

class PgBillService extends ApiService  {
  final PgBillRepository _pgBillRepository = PgBillRepository();

  PgBillService._privateConstructor();
  static final PgBillService _instance = PgBillService._privateConstructor();
  factory PgBillService() {
    return _instance;
  }

  //@Post
  Future<void> create(PgBill pgBill) async {
    return await _pgBillRepository.create(pgBill);
  }
}
