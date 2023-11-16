import 'package:dodohan/app/data/model/daily_opened_card.dart';
import 'package:dodohan/app/data/service/daily_card_service/repository.dart';
import 'package:dodohan/app/data/service/self_application_service/repository.dart';
import '../../enums.dart';
import '../../model/daily_card.dart';
import '../../model/self_application.dart';
import '../../provider/api_service.dart';
import '../daily_opened_card_service/repository.dart';
import '../user_service/repository.dart';
import '../you_info_service/repository.dart';

class SelfApplicationService extends ApiService  {
  final SelfApplicationRepository _selfApplicationRepository = SelfApplicationRepository();

  SelfApplicationService._privateConstructor();
  static final SelfApplicationService _instance = SelfApplicationService._privateConstructor();
  factory SelfApplicationService() {
    return _instance;
  }

  //@Post
  Future<SelfApplication> create(SelfApplication selfApplication) async {
    return await _selfApplicationRepository.create(selfApplication);
  }

}
