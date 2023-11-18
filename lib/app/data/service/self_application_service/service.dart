import 'package:dodohan/app/data/model/daily_opened_card.dart';
import 'package:dodohan/app/data/service/daily_card_service/repository.dart';
import 'package:dodohan/app/data/service/self_application_service/repository.dart';
import '../../../../core/services/push_service.dart';
import '../../enums.dart';
import '../../model/daily_card.dart';
import '../../model/self_application.dart';
import '../../model/user.dart';
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

  //@Patch
  Future<SelfApplication?> findOne(String selfIntroductionId, String applicant) async {
    return await _selfApplicationRepository.findOne(selfIntroductionId, applicant);
  }
  //@Patch
  Future<List<SelfApplication>> findMany(String selfIntroductionId) async {
    return await _selfApplicationRepository.findMany(selfIntroductionId);
  }

  //@Patch //openedByOwner & confirm1st & confirm2nd
  Future<SelfApplication> updateStatus(String selfApplicationId, SelfApplicationStatus status) async {
    final SelfApplication selfApplication = await _selfApplicationRepository.updateStatus(selfApplicationId, status);
    return selfApplication;
  }
}
