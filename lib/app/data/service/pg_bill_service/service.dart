import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stamp_now/app/data/service/daily_card_service/repository.dart';
import 'package:stamp_now/app/data/service/identity_service/repository.dart';
import 'package:stamp_now/app/data/service/pg_bill_service/repository.dart';
import '../../enums.dart';
import '../../model/daily_card.dart';
import '../../model/identity.dart';
import '../../model/me_info.dart';
import '../../model/pg_bill.dart';
import '../../model/you_info.dart';
import '../../provider/api_service.dart';
import '../me_info_service/repository.dart';
import '../user_service/repository.dart';
import '../you_info_service/repository.dart';

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
